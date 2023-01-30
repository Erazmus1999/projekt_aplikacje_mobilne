import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_aplikacje_mobilne/Models/fridge_item/fridge_item_model.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';

class MyDatabase {
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

  static Future<void> addProductToFridge({
    required String productName,
    required DateTime expirationDate,
    required String grams,
    required String userId,
  }) async {
    final fridge = await FirebaseFirestore.instance
        .collection('fridges')
        .doc(userId)
        .get();

    if (!fridge.exists) {
      await FirebaseFirestore.instance.collection('fridges').doc(userId).set({
        productName: [
          grams,
          expirationDate,
        ],
      });
    } else {
      await FirebaseFirestore.instance.collection('fridges').doc(userId).update(
        {
          productName: [
            grams,
            expirationDate,
          ],
        },
      );
    }
  }

  static Future<List<FridgeItemModel>> getAllUserProducts(String userId) async {
    final fridge = await FirebaseFirestore.instance
        .collection('fridges')
        .doc(userId)
        .get();

    if (!fridge.exists) {
      return [];
    } else {
      final List<FridgeItemModel> productList = [];
      final products = fridge.data()!;

      for (final key in products.keys) {
        final productSnapshot = await FirebaseFirestore.instance
            .collection('product')
            .doc(key)
            .get();

        final model = FridgeItemModel(
          product: Product(
            name: key,
            carbo: double.parse(productSnapshot.data()!['carbo'].toString()),
            fat: double.parse(productSnapshot.data()!['fat'].toString()),
            kcal: double.parse(productSnapshot.data()!['kcal'].toString()),
            protein:
                double.parse(productSnapshot.data()!['protein'].toString()),
            salt: double.parse(productSnapshot.data()!['salt'].toString()),
            vegan: productSnapshot.data()!['vegan'],
          ),
          grams: double.parse((products[key][0])),
          expirationDate: (products[key][1] as Timestamp).toDate(),
        );

        productList.add(model);
      }

      return productList;
    }
  }
}
