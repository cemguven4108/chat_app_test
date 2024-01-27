import 'package:chat_v2_app/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        //BlocProvider(create: (context) => UserBloc(UserService(UserRepository())),),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const LoginPage(),
      ),
    ),
  );
}