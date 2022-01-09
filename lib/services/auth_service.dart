import 'package:firebase_auth/firebase_auth.dart';

signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return "Signed In";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'User Not Found!';
    } else if (e.code == 'wrong-password') {
      return 'Wrong Password';
    } else {
      return 'Failed';
    }
  }
}

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
