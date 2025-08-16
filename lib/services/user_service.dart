import 'package:project03/models/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UserService {
  static const _userKeyPrefix = 'user_id_for_';

  /// 닉네임을 기반으로 기존 사용자 정보를 가져오거나 새로 생성합니다.
  Future<UserState> getOrCreateUser({
    required String nickname,
    String? profileImgUrl,
    required String address,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final userKey = '$_userKeyPrefix$nickname';

    String? senderId = prefs.getString(userKey);

    if (senderId == null) {
      // 해당 닉네임으로 저장된 ID가 없으면 새로 생성하고 기기에 저장합니다.
      senderId = const Uuid().v4();
      await prefs.setString(userKey, senderId);
    }

    // UserState 객체를 생성하여 반환합니다.
    return UserState(
      senderId: senderId,
      sender: nickname,
      profileImgUrl: profileImgUrl,
      address: address,
    );
  }
}
