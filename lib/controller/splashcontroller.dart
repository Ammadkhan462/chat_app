import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashcontroller extends GetxController {
  final auth = FirebaseAuth.instance;
  
  void onInit() async {
    super.onInit();

    await splashholder();
  }

  Future<void> splashholder() async {
    Future.delayed(Duration(seconds: 3), () {
      if (auth.currentUser == null) {
        Get.offAllNamed('/authpage');
      } else {
        Get.offAllNamed('/homepage');
        print(auth.currentUser!.email);
      }
    });
  }
}
