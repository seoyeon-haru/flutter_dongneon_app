import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/models/user_state.dart';
import 'package:project03/repositorys/storage_repository.dart';
import 'package:uuid/uuid.dart';

class UserProfileViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    // 앱이 시작될 때의 초기 사용자 상태
    return UserState();
  }

  // 로그인(게스트) 로직을 처리하고 사용자 상태를 업데이트하는 메서드
  Future<void> login({
    required String nickname,
    required String address,
    File? profileImage,
  }) async {
    final storageRepository = ref.read(storageRepositoryProvider);
    String profileImageUrl = '';
    final userId = const Uuid().v4(); // 사용자별 고유 ID 생성

    if (profileImage != null) {
      // 이미지가 있으면 Storage에 업로드하고 URL을 받아옵니다.
      profileImageUrl = await storageRepository.uploadProfileImage(
        image: profileImage,
        userId: userId,
      );
    }

    // Riverpod이 상태 변화를 감지하도록 새로운 UserState 객체를 생성하여 할당합니다.
    state = UserState(
      sender: nickname,
      address: address,
      senderId: userId,
      profileImgUrl: profileImageUrl,
    );
  }
}

final userProfileViewModelProvider =
    NotifierProvider<UserProfileViewModel, UserState>(
  () => UserProfileViewModel(),
);
