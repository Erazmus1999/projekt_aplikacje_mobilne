import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/share_fridge.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

import '../config/app_themes.dart';
import '../config/validators.dart';

class shareFridgePopup extends StatelessWidget {

  final usernameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Share your fridge'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: context.width() / 3,
            height: context.height() / 4,
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
                      labelText: 'E-mail',
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () async{
                        await ShareFridge().addSharing(usernameController.text);
                        Navigator.of(context).pop();
                      },
                      style: AppThemes.elevatedButtonStyle(context),
                      child: const Text('Share'),
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
