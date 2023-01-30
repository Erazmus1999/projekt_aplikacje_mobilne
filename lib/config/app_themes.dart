import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class AppThemes {
  static ButtonStyle elevatedButtonStyle(BuildContext context) =>
      ElevatedButton.styleFrom(
        fixedSize: Size(
          context.width(),
          50,
        ),
      );
}
