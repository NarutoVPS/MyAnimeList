import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBService {
  addFav(data, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('fav')
        .add(data);
  }

  getFavAnime() async {
    if (FirebaseAuth.instance.currentUser != null) {
      QuerySnapshot? querySnapshot;
      try {
        CollectionReference _favCollection = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('fav');
        querySnapshot = await _favCollection.get();
        // ignore: empty_catches
      } catch (e) {}
      return querySnapshot!.docs.map((doc) => doc.data()).toList();
    } else {
      return [];
    }
  }
}
