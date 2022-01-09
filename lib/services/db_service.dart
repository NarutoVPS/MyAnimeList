import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  addFav(data, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('fav')
        .add(data);
  }
}
