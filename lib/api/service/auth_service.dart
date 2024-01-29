import 'package:chat_v2_app/api/repository/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<String?> register(String email, String password) async {
    final result = await _authRepository.register(email, password);

    if (result.user == null) {
      print("There was a problem!!!!!");
    }
    return result.user!.uid;
  }
}
