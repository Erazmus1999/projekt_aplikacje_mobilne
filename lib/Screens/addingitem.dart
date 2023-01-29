import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddingItem extends StatefulWidget {
  const AddingItem({super.key});

  @override
  State<AddingItem> createState() => _AddingItemState();
}

class _AddingItemState extends State<AddingItem> {
  final TextEditingController controllerCarbo = TextEditingController();
  final TextEditingController controllerFat = TextEditingController();
  final TextEditingController controllerKcal = TextEditingController();
  final TextEditingController controllerProtein = TextEditingController();
  final TextEditingController controllerSalt = TextEditingController();
  final TextEditingController controllerVegan = TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  bool vegan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        children: [
          TextField(
            controller: controllerName,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: controllerCarbo,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Carbo',
            ),
          ),
          TextField(
            controller: controllerFat,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fat',
            ),
          ),
          TextField(
            controller: controllerKcal,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Kcal',
            ),
          ),
          TextField(
            controller: controllerProtein,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Protein',
            ),
          ),
          TextField(
            controller: controllerSalt,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Salt',
            ),
          ),
          TextField(
            controller: controllerVegan,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Vegan',
            ),
          ),
          Switch(
          // This bool value toggles the switch.
            value: vegan,
            activeColor: Colors.red,
            onChanged: (bool value) {
        // This is called when the user toggles the switch.
            setState(() {
            vegan = value;
        });
      },
    ),
        ],
      )),
    );
  }
}
