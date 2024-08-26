// import "package:chat_app/Profile/callPage/audiocallPage.dart";
// import "package:chat_app/Profile/callPage/videocall.dart";
// import "package:chat_app/models/callType.dart";
// import "package:chat_app/models/usermodel.dart";
// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:firebase_auth/firebase_auth.dart";
// import "package:flutter/material.dart";
// import "package:flutter/material.dart";
// import "package:get/get.dart";
// import "package:uuid/uuid.dart";

// class Callcontroller extends GetxController {
//   final db = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//   final uuid = Uuid().v4();
//   void onInit() {
//     super.onInit();
//     getnotification().listen((List<CallType> callList) {
//       if (callList.isEmpty) {
//         var calldata = callList[0];
//         if (calldata.type == "audio") {
//           audiocallnotification(calldata);
//         } else if (calldata.type == "video") {
//           videocallnotification(calldata);
//         }
//       }
//     });
//   }

//   Future<void> callAction(
//       UserModel reciever, UserModel caller, String type) async {
//     String id = uuid;
//     var Newcall = CallType(
//         id: id,
//         calleruid: caller.id,
//         callerEmail: caller.email,
//         callerName: caller.name,
//         callerpic: caller.imageUrl,
//         recieveruid: reciever.id,
//         recieverEmail: reciever.email,
//         status: "calling",
//         recieverName: reciever.name,
//         recieverpic: reciever.imageUrl,
//         type: type);
//     try {
//       await db
//           .collection("notification")
//           .doc(reciever.id)
//           .collection("call")
//           .doc(id)
//           .set(Newcall.toJson());
//       await db
//           .collection("Users")
//           .doc(auth.currentUser!.uid)
//           .collection("calls")
//           .doc(id)
//           .set(Newcall.toJson());
//       await db
//           .collection("Users")
//           .doc(reciever.id)
//           .collection("calls")
//           .doc(id)
//           .set(Newcall.toJson());
//       Future.delayed(Duration(seconds: 20), () {
//         endcall(Newcall);
//       });
//     } catch (e) {
//       print(e);
//     }
//     ;
//   }

//   Stream<List<CallType>> getnotification() {
//     return FirebaseFirestore.instance
//         .collection("notification")
//         .doc(auth.currentUser!.uid)
//         .collection("call")
//         .snapshots()
//         .map((snapshot) =>
//             snapshot.docs.map((doc) => CallType.fromJson(doc.data())).toList());
//   }

//   Future<void> endcall(CallType call) async {
//     try {
//       await db
//           .collection("notification")
//           .doc(call.recieveruid)
//           .collection("call")
//           .doc(call.id)
//           .delete();
//     } catch (e) {
//       print(e);
//     }
//     ;
//   }

//   Future<void> audiocallnotification(CallType calldata) async {
//     Get.snackbar(
//         duration: Duration(days: 1),
//         isDismissible: false,
//         icon: Icon(Icons.call), onTap: (snack) {
//       Audiocallpage(
//           target: UserModel(
//         id: calldata.calleruid,
//         email: calldata.callerEmail,
//         name: calldata.callerName,
//         imageUrl: calldata.callerpic,
//       ));
//     }, calldata.callerName!, "Incoming audio Call",
//         mainButton: TextButton(
//             onPressed: () {
//               endcall(calldata);
//             },
//             child: Text("End Call")));
//   }

//   Future<void> videocallnotification(CallType calldata) async {
//     Get.snackbar(
//         duration: Duration(days: 1),
//         isDismissible: false,
//         icon: Icon(Icons.videocam), onTap: (snack) {
//       vediocallpage(
//           target: UserModel(
//         id: calldata.calleruid,
//         email: calldata.callerEmail,
//         name: calldata.callerName,
//         imageUrl: calldata.callerpic,
//       ));
//     }, calldata.callerName!, "Incoming Video Call",
//         mainButton: TextButton(
//             onPressed: () {
//               endcall(calldata);
//             },
//             child: Text("End Call")));
//   }
// }
