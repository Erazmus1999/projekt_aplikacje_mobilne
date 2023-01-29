import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/Screens/addingitem.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';
import 'package:projekt_aplikacje_mobilne/config/validators.dart';

class AddFridgeItem extends StatefulWidget {
  const AddFridgeItem({super.key});

  @override
  State<AddFridgeItem> createState() => _AddFridgeItemState();
}

class _AddFridgeItemState extends State<AddFridgeItem> {
  late List<Product> items;
  Product? selectedProduct;
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to fridge'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            runSpacing: 20,
            children: [
              FutureBuilder<List<Product>>(
                future: MyDatabase.getAllItems(),
                initialData: const <Product>[],
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: context.width(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<Product>(
                          value: selectedProduct,
                          isDense: false,
                          isExpanded: true,
                          items: snapshot.data!
                              .map(
                                (p) => DropdownMenuItem<Product>(
                                  value: p,
                                  child: Text(p.name),
                                ),
                              )
                              .toList(),
                          onChanged: (p) => setState(() => selectedProduct = p),
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      validator: (text) => Validators.notEmpty(text),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Grams',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //TODO: add to fridge
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
                  child: Text('Add item fridge'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddingItem(),
                    ),
                  );
                },
                child: const Center(
                  child: Text('You don\'t see your item? Add it here'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
