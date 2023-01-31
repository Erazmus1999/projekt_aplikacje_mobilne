import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projekt_aplikacje_mobilne/utils/util_functions.dart';

class ShareFridge {
  final CollectionReference sharingCollection =
      FirebaseFirestore.instance.collection('sharing');
  Future<void> addSharing(String username) async {
    if (await checkIfUserExists(username)) {
      List<String> sharedFridges = await getUserSharedFridges(username);
      sharedFridges.add(username);
      print('aaaaaaaa ${sharedFridges.length}');
      await sharingCollection
          .doc(username)
          .update({"shared": FieldValue.arrayUnion(sharedFridges)});
    } else {
      showToast('User doesn\'t exist');
    }
  }

  Future<bool> checkIfUserExists(String username) async {
    try {
      var doc = await sharingCollection.doc(username).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getUserSharedFridges(String username) async {
    List<dynamic> sharedList = <dynamic>[];
    await sharingCollection
        .where("login", isEqualTo: username)
        .get()
        .then((QuerySnapshot result) => {
              result.docs.forEach((element) {
                sharedList = element["shared"];
              })
            });
    return sharedList.map((e) => e.toString()).toList();
  }
}
