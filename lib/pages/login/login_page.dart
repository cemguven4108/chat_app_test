import 'package:chat_v2_app/pages/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Chatting"),
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.9,
                child: const LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}