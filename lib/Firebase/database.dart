import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';

class MyDatabase {
  static void getPotato() async {
    CollectionReference<Map<String, dynamic>> firestore =
        FirebaseFirestore.instance.collection('product');
    var temp = await firestore.doc('potato').get();
    print(temp['kcal']);
  }

  static Future<List<Product>> getAllItems() async {
    final List<Product> items = [];
    CollectionReference<Map<String, dynamic>> snapshot =
        FirebaseFirestore.instance.collection('product');
    final document = await snapshot.get();
    document.docs.forEach((element) {
      items.add(
        Product(
          name: element.id,
          carbo: double.parse(element.data()['carbo'].toString()),
          fat: double.parse(element.data()['fat'].toString()),
          kcal: double.parse(element.data()['kcal'].toString()),
          protein: double.parse(element.data()['protein'].toString()),
          salt: double.parse(element.data()['salt'].toString()),
          vegan: element.data()['vegan'],
        ),
      );
    });

    return items;
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
