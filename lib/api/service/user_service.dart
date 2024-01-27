import 'package:chat_v2_app/api/repository/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<String?> create(Map<String, dynamic> data) async {
    final user = await _userRepository.create(data);
    return user.id;
  }
}
