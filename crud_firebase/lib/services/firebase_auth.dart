import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        return 1;
      } else if (e.code == 'user-not-found') {
        return 2;
      } else if (e.code == 'wrong-password') {
        return 3;
      }
    } catch (e) {
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
        return 1;
      } else if (e.code == 'weak-password') {
        return 2;
      } else if (e.code == 'email-already-in-use') {
        return 3;
      }
    } catch (e) {
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
