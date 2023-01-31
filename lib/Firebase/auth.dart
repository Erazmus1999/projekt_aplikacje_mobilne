import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projekt_aplikacje_mobilne/utils/util_functions.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> registerAndLoginUser(
      String login, String password) async {
    final List<String> emptyList=<String>[];
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: login,
        password: password,
      );
      await FirebaseFirestore.instance.collection('sharing').doc(login).set(
          {'shared': emptyList, 'login': login});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      }
      if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      }
      if(e.code == 'invalid-email'){
        showToast('Wrong email format');
      }
      else{
        print(e.code);
      }
    }
  }

  static Future<void> loginUser(String login, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: login,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      }
      if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      }
    }
  }
}
