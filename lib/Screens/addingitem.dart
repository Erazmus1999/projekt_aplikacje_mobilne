import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';
import 'package:projekt_aplikacje_mobilne/config/validators.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add item'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Form(
          key: formKey,
          child: Wrap(
            runSpacing: 10,
            children: [
              TextFormField(
                controller: controllerName,
                obscureText: false,
                validator: (text) => Validators.notEmpty(text),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: controllerCarbo,
                validator: (text) => Validators.notEmpty(text),
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Carbo',
                ),
              ),
              TextFormField(
                controller: controllerFat,
                validator: (text) => Validators.notEmpty(text),
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fat',
                ),
              ),
              TextFormField(
                controller: controllerKcal,
                validator: (text) => Validators.notEmpty(text),
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kcal',
                ),
              ),
              TextFormField(
                controller: controllerProtein,
                validator: (text) => Validators.notEmpty(text),
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Protein',
                ),
              ),
              TextFormField(
                controller: controllerSalt,
                validator: (text) => Validators.notEmpty(text),
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Salt',
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Vegan'),
                      const SizedBox(
                        width: 5,
                      ),
                      Switch(
                        value: vegan,
                        onChanged: (bool value) {
                          setState(() {
                            vegan = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final Product product = Product(
                      name: controllerName.text,
                      carbo: double.parse(controllerCarbo.text),
                      fat: double.parse(controllerFat.text),
                      kcal: double.parse(controllerKcal.text),
                      protein: double.parse(controllerProtein.text),
                      salt: double.parse(controllerSalt.text),
                      vegan: vegan,
                    );

                    MyDatabase.addProduct(product);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    context.width(),
                    50,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add item to database'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllerCarbo.dispose();
    controllerFat.dispose();
    controllerKcal.dispose();
    controllerName.dispose();
    controllerProtein.dispose();
    controllerSalt.dispose();
    controllerVegan.dispose();
    super.dispose();
  }
}
