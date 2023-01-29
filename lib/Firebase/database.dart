import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';

class MyDatabase {
  static void getPotato() async {
    CollectionReference<Map<String, dynamic>> firestore =
        FirebaseFirestore.instance.collection('product');
    var temp = await firestore.doc('potato').get();
  }

  static void addProduct(Product product) async {
    FirebaseFirestore.instance.collection("product").doc(product.name).set(
      {
        "carbo": product.carbo,
        "fat": product.fat,
        "kcal": product.kcal,
        "protein": product.protein,
        "salt": product.salt,
        "vegan": product.vegan,
      },
    );
  }
}
