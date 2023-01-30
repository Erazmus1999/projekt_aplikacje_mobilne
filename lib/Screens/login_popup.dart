import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

import '../config/validators.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login to fridge'),
      contentPadding: EdgeInsets.all(20.0),
      content: Builder(
        builder: (context){
          return Container(
            width: context.width()/3,
            height: context.height()/3,
            child: Form(
              key: formKey,
              child: Wrap(
                runSpacing: 10,
                children: [
                  TextFormField(
                    controller: usernameController,
                    obscureText: false,
                    validator: (text) => Validators.notEmpty(text),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login',
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
                      onPressed: (){

                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}