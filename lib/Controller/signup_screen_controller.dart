import 'package:flutter/material.dart';
import 'package:fruits/Helpers/constant.dart';
import 'package:fruits/Helpers/routes.dart';
import 'package:fruits/Models/user_model.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreenController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup(TextEditingController emailController, TextEditingController passwordController) async {
    try {
      var firebaseAuth = (await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text));
      var firebaseUser = firebaseAuth.user;

      if (firebaseUser != null) {
        var user = UserModel(
          email: firebaseUser.email,
          uid: firebaseUser.uid,
        );
        GetStorage().write('user', user.toJson());
        print(GetStorage().read('user'));
        await FirebaseFirestore.instance
            .collection('FruitAppUser')
            .doc(firebaseAuth.user!.uid)
            .set(user.toJson());
        Get.offNamed(Routes.HOME_SCREEN);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Message', " ${e.message}",
          backgroundColor: orange,
          isDismissible: true,
          duration: Duration(seconds: 3),
          colorText: white);

    } finally {}
  }
}