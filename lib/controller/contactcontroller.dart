import 'package:chat_app/Home/widget/chatslist.dart';
import 'package:chat_app/models/chatroommodel.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contactcontroller extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxList<ChatRoomModel> chatroommodel = <ChatRoomModel>[].obs;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  void onInit() {
    super.onInit();
    getUserList();
    getchatroomList();
  }

  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      await db.collection("users").get().then((value) => {
            userList.value = value.docs
                .map((e) => UserModel.fromJson(
                      e.data(),
                    ))
                .toList()
          });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getchatroomList() async {
    List<ChatRoomModel> tempchatRoomList = [];
    try {
      await db
          .collection("Chats")
          .orderBy("timestamp", descending: true)
          .get()
          .then((value) => {
                tempchatRoomList = value.docs
                    .map((e) => ChatRoomModel.fromJson(
                          e.data(),
                        ))
                    .toList()
              });
    } catch (e) {
      print(e);
    }

    chatroommodel.value = tempchatRoomList
        .where((e) => e.id!.contains(
              auth.currentUser!.uid,
            ))
        .toList();
    print(chatroommodel);
  }
}
