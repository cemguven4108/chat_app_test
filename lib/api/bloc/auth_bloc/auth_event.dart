import 'package:chat_v2_app/api/requests/auth_requests/auth_register_request.dart';

abstract class AuthEvent {}

class AuthEventRegister extends AuthEvent {
  final AuthRegisterRequest request;

  AuthEventRegister({
    required this.request,
  });
}
