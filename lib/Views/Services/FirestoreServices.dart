import 'package:emart_app/consts/firebaseConst.dart';

class FirestoreServices {
  // Get Users data
  static getUser(uid) {
    return FireStore.collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
