import 'package:chat_v2_app/api/repository/user_repository.dart';
import 'package:chat_v2_app/api/requests/user_requests/user_create_request.dart';
import 'package:chat_v2_app/api/requests/user_requests/user_update_request.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<String?> create(UserCreateRequest request) async {
    
    await _userRepository.create(request.toJson());

    return null;
  }

  Future<void> update(UserUpdateRequest request) async {
  }
}