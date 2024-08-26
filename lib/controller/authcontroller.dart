import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authcontroller extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final db = FirebaseFirestore.instance;
  Future<void> login(String email, String password) async {
    isLoading.value = true;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User is not found');
        Get.snackbar('Error', 'User not found. Please check your email.');
      } else if (e.code == 'wrong-password') {
        print('Incorrect password');
        Get.snackbar('Error', 'Incorrect password. Please try again.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email');
        Get.snackbar('Error', 'The email address is badly formatted.');
      } else if (e.code == 'user-disabled') {
        print('User disabled');
        Get.snackbar('Error', 'This user has been disabled.');
      } else {
        print('Unhandled error: ${e.code}');
        Get.snackbar('Error', 'An error occurred: ${e.message}');
      }
    } catch (e) {
      print('An error occurred: $e');
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createUser(String email, String password, String name) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Account is created");
      await userInit(
        email,
        name,
      );
      Get.offAllNamed(
          '/homepage'); // Navigate to homepage after successful sign up
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email already in use');
        Get.snackbar('Error',
            'This email address is already in use. Please try another email.');
      } else if (e.code == 'weak-password') {
        print('Password is too weak');
        Get.snackbar('Error',
            'The password provided is too weak. Please choose a stronger password.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email');
        Get.snackbar('Error', 'The email address is badly formatted.');
      } else {
        print('Unhandled error: ${e.code}');
        Get.snackbar('Error', 'An unexpected error occurred: ${e.message}');
      }
    } catch (e) {
      print('An error occurred: $e');
      Get.snackbar('Error', 'An unexpected error occurred. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.offAllNamed('/authpage');
  }

  Future<void> userInit(String email, String name) async {
    String userId = auth.currentUser!.uid; // Get the user's UID
    var newuser = UserModel(id: userId, email: email, name: name); // Set the ID
    try {
      await db.collection("users").doc(userId).set(newuser.toJson());
    } catch (e) {
      print(e);
    }
  }
}
