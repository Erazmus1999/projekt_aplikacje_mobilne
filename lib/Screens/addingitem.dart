import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddingItem extends StatelessWidget {
  AddingItem({super.key});

  final TextEditingController controllerCarbo = TextEditingController();
  final TextEditingController controllerFat= TextEditingController();
  final TextEditingController controllerKcal= TextEditingController();
  final TextEditingController controllerProtein= TextEditingController();
  final TextEditingController controllerSalt= TextEditingController();
  final TextEditingController controllerVegan= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        children: [
          TextField(
            controller: controllerCarbo,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Carbo',
            ),
          ),
          TextField(
            controller: controllerFat,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fat',
            ),
          ),
          TextField(
            controller: controllerKcal,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Kcal',
            ),
          ),
          TextField(
            controller: controllerProtein,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Protein',
            ),
          ),
          TextField(
            controller: controllerSalt,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Salt',
            ),
          ),
          TextField(
            controller: controllerVegan,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Vegan',
            ),
          ),
        ],
      )),
    );
  }
}
