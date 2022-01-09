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

signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return "Signed In";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
  }
}

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
