import 'package:project03/repositorys/login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 원래는 vWorldRepository
// 1. 상태만들기 => List<String> 사용
// 2. 뷰모델 만들기
class LoginViewModel extends AutoDisposeNotifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  final loginRepository = LoginRepository();

  Future<void> searchByAddress(double lat, double lng) async {
    state = await loginRepository.findByLatLng(lat: lat, lng: lng);
  }
}

// 3. 뷰모델 관리자 만들기
final loginViewModel =
    NotifierProvider.autoDispose<LoginViewModel, List<String>>(
        () => LoginViewModel());
