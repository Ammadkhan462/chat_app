import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dbcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  void onInit(){
    super.onInit();
      getUserList();
  }
  Future<void> getUserList() async {
    isLoading.value = true;
   try{ await db.collection("users").get().then((value) => {
          userList.value = value.docs
              .map((e) => UserModel.fromJson(
                    e.data(),
                  ))
              .toList()
        });}
        catch(e){ print(e); }
        isLoading.value = false;
  }
}
