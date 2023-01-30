import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/auth.dart';
import 'package:projekt_aplikacje_mobilne/config/app_themes.dart';
import 'package:projekt_aplikacje_mobilne/config/validators.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 10,
        children: [
          TextFormField(
            controller: usernameController,
            validator: (text) => Validators.notEmpty(text),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'E-mail',
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (text) => Validators.notEmpty(text),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Auth.registerAndLoginUser(
                  usernameController.text,
                  passwordController.text,
                ).then(
                  (value) => Navigator.pop(context),
                );
              },
              style: AppThemes.elevatedButtonStyle(context),
              child: const Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
