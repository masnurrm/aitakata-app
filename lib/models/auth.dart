import 'package:firebase_auth/firebase_auth.dart';

class SignInSignUpResult{
  final String? message;
  final User? user;

  SignInSignUpResult({this.message, this.user});
}