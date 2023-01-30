import 'package:firebase_auth/firebase_auth.dart';
import 'package:projekt_aplikacje_mobilne/utils/util_functions.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> registerAndLoginUser(
      String login, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
