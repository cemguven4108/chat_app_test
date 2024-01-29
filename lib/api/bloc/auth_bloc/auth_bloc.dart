import 'package:bloc/bloc.dart';
import 'package:chat_v2_app/api/bloc/auth_bloc/auth_event.dart';
import 'package:chat_v2_app/api/bloc/auth_bloc/auth_state.dart';
import 'package:chat_v2_app/api/requests/auth_requests/auth_register_request.dart';
import 'package:chat_v2_app/api/requests/user_requests/user_create_request.dart';
import 'package:chat_v2_app/api/service/auth_service.dart';
import 'package:chat_v2_app/api/service/user_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final UserService _userService;

  AuthBloc(this._authService, this._userService)
      : super(AuthStateInitialize()) {
    on<AuthEventRegister>(
      (event, emit) => _onRegister(event.request, emit),
    );
  }

  void _onRegister(AuthRegisterRequest request, Emitter<AuthState> emit) async {
    emit(AuthStateRegistering());

    final result = await _authService.register(request.email, request.password);

    final id = await _userService.create(
      UserCreateRequest(
        id: result!,
        fullName: request.fullName,
        email: request.email,
        imageUrl: request.imageUrl,
      ),
    );

    emit(AuthStateRegistered(id: id!));
  }
}
