import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('The email address is not valid.');
        return 1;
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 2;
      } else if (e.code == 'email-already-in-use') {
        print('The email address is already in use.');
        return 3;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
