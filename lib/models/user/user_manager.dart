import 'package:ecommerce_completo/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIn(User user) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      debugPrint(result.user.uid);
    } on PlatformException catch (error) {
      debugPrint(error.toString());
      throw Exception();
    }
  }
}