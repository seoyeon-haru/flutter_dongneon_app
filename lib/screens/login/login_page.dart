import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project03/services/user_service.dart';
import '../chat/chat_page.dart';
import '../../utils/app_theme.dart';
import '../../utils/geolocator_helper.dart';
import '../../view_model/login_view_model.dart';
import '../../view_model/user_profile_view_model.dart';

// 시작하기 버튼의 로딩 상태를 관리
final selectedImageProvider = StateProvider<File?>((ref) => null);
final loginLoadingProvider = StateProvider<bool>((ref) => false);

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _userService = UserService();
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
    final selectedImage = ref.watch(selectedImageProvider);
    final isLoading = ref.watch(loginLoadingProvider);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 88),
              GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    ref.read(selectedImageProvider.notifier).state =
                        File(image.path);
                  }
                },
                child: SizedBox(
                  width: 116,
                  height: 116,
                  child: selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            selectedImage,
                            width: 116,
                            height: 116,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
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
                  onPressed: isLoading
                      ? null
                      : () async {
                          // 닉네임 널처리
                          final nickname = _senderController.text.trim();
                          if (nickname.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('닉네임을 입력해주세요'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          // 위치정보 널처리
                          if (locationAddress.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('위치 정보를 가져와주세요'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // 로딩 시작
                          ref.read(loginLoadingProvider.notifier).state = true;

                          // 1. 기존 ViewModel을 호출하여 프로필 이미지 업로드 등 선행 작업을 처리합니다.
                          await ref
                              .read(userProfileViewModelProvider.notifier)
                              .login(
                                nickname: nickname,
                                address: locationAddress.isNotEmpty
                                    ? locationAddress[0]
                                    : '',
                                profileImage: selectedImage,
                              );

                          // 2. ViewModel에서 업데이트된 사용자 정보(특히 업로드된 이미지 URL)를 가져옵니다.
                          final initialUserState =
                              ref.read(userProfileViewModelProvider);

                          // 3. UserService를 사용하여 기기에 저장된 영속적인 senderId를 가진
                          //    최종 UserState 객체를 생성합니다.
                          final finalUserState =
                              await _userService.getOrCreateUser(
                            nickname: initialUserState.sender,
                            address: initialUserState.address,
                            profileImgUrl: initialUserState.profileImgUrl,
                          );

                          ref.read(loginLoadingProvider.notifier).state =
                              false; // 로딩 종료

                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // 4. 최종 사용자 정보를 ChatPage로 전달합니다.
                                builder: (context) =>
                                    ChatPage(userState: finalUserState),
                              ),
                            );
                          }
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
                  child: isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text('시작하기', style: AppTextStyles.tealText20),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
