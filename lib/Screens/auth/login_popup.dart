import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Screens/auth/login_form.dart';
import 'package:projekt_aplikacje_mobilne/Screens/auth/register_form.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

import '../../config/validators.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isLogin ? 'Login' : 'Register'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: context.width() / 3,
            height: context.height() / 3,
            child: Column(
              children: [
                isLogin ? const LoginForm() : const RegisterForm(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'You don\'t have account? Register here.'
                        : 'You already have account? Login here.',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
