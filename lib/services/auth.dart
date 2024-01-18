import 'package:firebase_auth/firebase_auth.dart';
import 'package:aitakata_app/models/auth.dart';

class Auth{
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> createUser({required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail({required String email, required String pass}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static void signOut() {
   _auth.signOut();
 }
}