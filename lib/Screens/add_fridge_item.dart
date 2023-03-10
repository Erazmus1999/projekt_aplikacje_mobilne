import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/Screens/addingitem.dart';
import 'package:projekt_aplikacje_mobilne/config/constants.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';
import 'package:projekt_aplikacje_mobilne/config/validators.dart';
import 'package:projekt_aplikacje_mobilne/utils/util_functions.dart';

class AddFridgeItem extends StatefulWidget {
  const AddFridgeItem({super.key});

  @override
  State<AddFridgeItem> createState() => _AddFridgeItemState();
}

class _AddFridgeItemState extends State<AddFridgeItem> {
  late List<Product> items;
  Product? selectedProduct;
  DateTime? selectedDateTime;
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final dateTimeController = TextEditingController();
  final future = MyDatabase.getAllItems();

  @override
  void initState() {
    super.initState();
    future;
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
                future: future,
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: dateTimeController,
                      validator: (text) => Validators.notEmpty(text),
                      readOnly: true,
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        selectedDateTime = value;
                        dateTimeController.text =
                            showableFormat.format(value!).toString();
                      }),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(),
                        labelText: 'Expiration Date',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      selectedProduct != null &&
                      selectedDateTime != null) {
                    if (FirebaseAuth.instance.currentUser != null) {
                      MyDatabase.addProductToFridge(
                        productName: selectedProduct!.name,
                        expirationDate: selectedDateTime!,
                        grams: controller.text,
                        userId: FirebaseAuth.instance.currentUser!.email!,
                      ).then(
                        (value) => Navigator.pop(context),
                      );
                    } else {
                      showToast('Log in first');
                    }
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
