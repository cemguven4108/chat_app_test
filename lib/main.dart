import 'package:chat_v2_app/api/bloc/auth_bloc/auth_bloc.dart';
import 'package:chat_v2_app/api/bloc/user_bloc/user_bloc.dart';
import 'package:chat_v2_app/api/repository/auth_repository.dart';
import 'package:chat_v2_app/api/repository/user_repository.dart';
import 'package:chat_v2_app/api/service/auth_service.dart';
import 'package:chat_v2_app/api/service/user_service.dart';
import 'package:chat_v2_app/firebase_options.dart';
import 'package:chat_v2_app/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            AuthService(AuthRepository()),
            UserService(
              UserRepository.instance(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UserBloc(
            UserService(
              UserRepository.instance(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const LoginPage(),
      ),
    ),
  );
}
