import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/models/chatmode.dart';
import 'package:chat_app/models/chatroommodel.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Chatcontroller extends GetxController {
  final auth = FirebaseAuth.instance;
  RxString selectedImagePath = "".obs;
  final db = FirebaseFirestore.instance;
  Profilecontroller profilecontroller = Get.put(Profilecontroller());
  var uuid = Uuid();
  RxBool isLoading = false.obs;
  String getRoomId(targetuserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetuserId[1].codeUnitAt(0)) {
      return currentUserId + targetuserId;
    } else {
      return targetuserId + currentUserId;
    }
  }

  Future<void> sendMessage(
      String targetuserId, String message, UserModel targetuser) async {
    String roomId = getRoomId(targetuserId);
    isLoading.value = true;
    DateTime timestamp = DateTime.now();
    String NowTime = DateFormat('hh:mm:a').format(timestamp);
    String chatId = uuid.v6();
    RxString imgurl = "".obs;
    if (selectedImagePath.value!.isNotEmpty) {
      imgurl.value = (await profilecontroller
          .uploadFileToFirebase(selectedImagePath.value))!;
    }
    var newChat = ChatModel(
        id: chatId,
        message: message,
        imageUrl: imgurl.value,
        senderId: auth.currentUser!.uid,
        receiverId: targetuserId,
        timeStamp: DateTime.now().toString(),
        senderName: profilecontroller.currentuser!.value.name);
    UserModel sender =
        getSender(profilecontroller.currentuser.value, targetuser);
    UserModel reciever =
        getReciever(profilecontroller.currentuser.value, targetuser);
    var roomDetails = ChatRoomModel(
        id: roomId,
        lastmessage: message,
        lastmessagetimestamp: NowTime,
        sender: sender,
        reciever: reciever,
        timestamp: DateTime.now().toString(),
        unReadMessageno: 0);
    try {
      await db.collection('Chats').doc(roomId).set(roomDetails.toJson());
      await db
          .collection('Chats')
          .doc(roomId)
          .collection('messages')
          .doc(chatId)
          .set(newChat.toJson());
      selectedImagePath.value = "";
    } catch (e) {
      print('Error sending message: $e');
    }
    isLoading.value = false;
  }

  UserModel getSender(UserModel currentuser, UserModel targetuser) {
    String currentuserId = currentuser.id!;
    String targetUserId = targetuser.id!;
    if (currentuserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentuser;
    } else {
      return targetuser;
    }
  }

  UserModel getReciever(UserModel currentUser, UserModel targetuser) {
    String currentuserId = currentUser.id!;
    String targetUserId = targetuser.id!;
    if (currentuserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetuser;
    } else {
      return currentUser;
    }
  }

  Stream<List<ChatModel>> getMessages(String targetuserId) {
    String roomId = getRoomId(targetuserId);
    return db
        .collection('Chats')
        .doc(roomId)
        .collection('messages')
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());
  }

  Stream<UserModel> getStatus(String uid) {
    return db.collection('users').doc(uid).snapshots().map((snapshot) {
      return UserModel.fromJson(snapshot.data()!);
    });
  }
}
