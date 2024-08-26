// import 'package:chat_app/config/string.dart';
// import 'package:chat_app/controller/chatcontroller.dart';
// import 'package:chat_app/controller/profilecontroller.dart';
// import 'package:chat_app/models/usermodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class Audiocallpage extends StatelessWidget {
//   final UserModel target;
//   const Audiocallpage({super.key, required this.target});

//   @override
//   Widget build(BuildContext context) {
//     Profilecontroller profilecontroller = Get.put(Profilecontroller());
//     Chatcontroller chatcontroller = Get.put(Chatcontroller());

//     var callId = chatcontroller.getRoomId(target.id!);
//     return ZegoUIKitPrebuiltCall(
//         appID: ZegoCloud.appid,
//         appSign: ZegoCloud.appSign,
//         callID: callId,
//         userID: profilecontroller.currentuser.value.id! ?? "root",
//         userName: profilecontroller.currentuser.value.name! ?? "root",
//         config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall());
//   }
// }
