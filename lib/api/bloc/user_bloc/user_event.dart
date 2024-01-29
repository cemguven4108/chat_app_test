import 'package:chat_v2_app/api/requests/user_requests/user_create_request.dart';

abstract class UserEvent {}

class UserEventAdd implements UserEvent {
  final UserCreateRequest user;

  UserEventAdd({
    required this.user,
  });
}
