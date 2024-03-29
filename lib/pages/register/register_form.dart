import 'dart:io';

import 'package:chat_v2_app/api/bloc/auth_bloc/auth_bloc.dart';
import 'package:chat_v2_app/api/bloc/auth_bloc/auth_event.dart';
import 'package:chat_v2_app/api/requests/auth_requests/auth_register_request.dart';
import 'package:chat_v2_app/pages/register/register_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  File? _selectedImage;
  late GlobalKey<FormState> _formKey;
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildImage(),
          buildFormFields(),
          buildFormButton(),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (_selectedImage != null) {
      return Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          CircleAvatar(
            radius: 90,
            backgroundImage: FileImage(_selectedImage!),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white70,
            ),
            onPressed: () => _pickImage(),
          ),
        ],
      );
    }
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        const Icon(
          Icons.person_outline,
          size: 100,
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white70,
          ),
          onPressed: () => _pickImage(),
        ),
      ],
    );
  }

  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Widget buildFormFields() {
    return Flexible(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RegisterFormField(
            controller: fullNameController,
            hintText: "Full Name",
          ),
          RegisterFormField(
            isEmail: true,
            controller: emailController,
            hintText: "Email",
          ),
          RegisterFormField(
            controller: passwordController,
            hintText: "Password",
            isPassword: true,
          ),
          RegisterFormField(
            controller: passwordRepeatController,
            hintText: "Password Repeat",
            isPassword: true,
          ),
        ],
      ),
    );
  }

  Widget buildFormButton() {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {
          final result = _formKey.currentState!.validate();
          if (result) {
            _formKey.currentState!.save();
            context.read<AuthBloc>().add(
                  AuthEventRegister(
                    request: AuthRegisterRequest(
                      fullName: fullNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      imageUrl: _selectedImage!.path,
                    ),
                  ),
                );
            Future.delayed(
              const Duration(seconds: 2),
              () => Navigator.of(context).pop(),
            );
          }
        },
        child: const Text("Register"),
      ),
    );
  }
}
