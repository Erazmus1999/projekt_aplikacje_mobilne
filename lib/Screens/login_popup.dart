import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';
class LoginPopup extends StatelessWidget {
  const LoginPopup({Key? key}) : super(key: key);

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
          );
        },
      ),
    );
  }
}
