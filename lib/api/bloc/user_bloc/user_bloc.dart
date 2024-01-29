import 'package:chat_v2_app/api/bloc/user_bloc/user_event.dart';
import 'package:chat_v2_app/api/bloc/user_bloc/user_state.dart';
import 'package:chat_v2_app/api/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService;

  UserBloc(this._userService) : super(UserStateInit()) {
    on<UserEventAdd>((event, emit) => _onAdd(event, emit));
  }

  void _onAdd(UserEventAdd event, Emitter<UserState> emit) async {
    emit(UserStateRegistering());

    await _userService.create(event.user);

    emit(UserStateRegistered());
  }
}