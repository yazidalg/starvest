import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  User? user;

  Future<User?> googleSignIn() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCred =
            await firebaseAuth.signInWithCredential(credential);
        user = userCred.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == "account-exists-with-different-credential") {
          Get.snackbar("Error", e.message!);
        } else if (e.code == "invalid-credential") {
          Get.snackbar("Error", e.message!);
        }
      } catch (e) {
        throw Exception(e);
      }
    }
    return user;
  }

  Future<User?> register(String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        Get.snackbar("Error", e.message!);
      } else if (e.code == "invalid-credential") {
        Get.snackbar("Error", e.message!);
      }
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        Get.snackbar("Error", e.message!);
      } else if (e.code == "invalid-credential") {
        Get.snackbar("Error", e.message!);
      }
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
