import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase
{
  static void getPotato() async
  {
      CollectionReference<Map<String, dynamic>> firestore = FirebaseFirestore.instance.collection('product');
      var temp = await firestore.doc('potato').get();
      print(temp['kcal']);
  }
}