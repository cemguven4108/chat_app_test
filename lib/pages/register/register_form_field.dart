import 'package:flutter/material.dart';

class RegisterFormField extends StatelessWidget {
  const RegisterFormField({
    Key? key,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.height * 0.4,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Cannot be empty";
          }
          if (isEmail && !value.contains("@")) {
            return "Wrong Email Format";
          }
          if (isPassword && value.length < 8) {
            return "Password Must Be More Than 8 Characters Long";
          }
          return null;
        },
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : TextInputType.visiblePassword,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            isPassword ? Icons.key_outlined : Icons.email_outlined,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}