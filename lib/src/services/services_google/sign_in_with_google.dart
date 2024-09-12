import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //register email in db
      

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error en signInWithGoogle: $e');
      return null;
    }
  }

  Future<User?> checkUserSession(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
