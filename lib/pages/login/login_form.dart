import 'package:chat_v2_app/pages/login/login_form_field.dart';
import 'package:chat_v2_app/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> _formKey;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildFormFields(),
          buildFormButton(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      "Chatting",
      style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildFormFields() {
    return Column(
      children: <Widget>[
        LoginFormField(
          controller: emailController,
          hintText: "Email",
        ),
        LoginFormField(
          controller: passwordController,
          hintText: "Password",
          isPassword: true,
        ),
      ],
    );
  }

  Widget buildFormButton() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: const Text(
              "Register?",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Login"),
        ),
      ],
    );
  }
}
