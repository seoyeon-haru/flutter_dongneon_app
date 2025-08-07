import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../chat/chat_page.dart';
import '../../models/user_state.dart';
import '../../utils/app_theme.dart';
import '../../utils/geolocator_helper.dart';
import '../../view_model/login_view_model.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _senderController = TextEditingController();

  // 위치 정보 가져오기 메소드
  Future<void> _getLocationAddress(WidgetRef ref) async {
      // 현재 위치 가져오기
      final position = await GeolocatorHelper.getPositon();
      if (position != null) {
        // 좌표로 주소 검색
        await ref
            .read(loginViewModel.notifier)
            .searchByAddress(position.latitude, position.longitude);
      }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAddress = ref.watch(loginViewModel);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/ic_appbar.png',
              width: 33,
              height: 25,
            ),
            const SizedBox(width: 8),
            const Text(
              '게스트로 시작하기',
              style: AppTextStyles.appBarTitle,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 88),
            GestureDetector(
              onTap: () {
                //[TODO] 프로필 이미지 선택 로직 추가 필요 : 동동동세진님
              },
              child: SizedBox(
                width: 116,
                height: 116,
                child: Image.asset(
                  'assets/ic_person.png',
                ),
              ),
            ),
            const SizedBox(height: 35),
            // 닉네임 입력 필드-----------------------------------------
            Container(
              height: 40,
              width: 270,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                border: Border.all(
                    color: Color(0xFF877F7F).withOpacity(0.49), width: 1),
              ),
              child: TextField(
                controller: _senderController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '사용할 닉네임을 입력하세요',
                  hintStyle: AppTextStyles.placeHolderText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  alignLabelWithHint: true,
                  hintTextDirection: TextDirection.ltr,
                ),
              ),
            ),
            const SizedBox(height: 34),
            // 위치 정보 가져오기 버튼-----------------------------------------
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    _getLocationAddress(ref);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    '위치 정보 가져오기',
                    style: AppTextStyles.tealText20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // 위치 주소 텍스트-----------------------------------------
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                locationAddress.isEmpty
                    ? '위치 정보 가져오기를 눌러주세요'
                    : locationAddress[0],
                style: locationAddress.isEmpty
                    ? AppTextStyles.greyText18
                    : AppTextStyles.brownText18,
              ),
            ),
            const SizedBox(height: 38),
            // 시작하기 버튼-----------------------------------------
            Container(
              width: 362,
              height: 57,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_senderController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('닉네임을 입력해주세요'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        userState: UserState(
                          address: locationAddress[0],
                          sender: _senderController.text.trim(),
                          senderId: '',
                          profileImgUrl: '',
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: AppColors.black,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  '시작하기',
                  style: AppTextStyles.tealText20,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
