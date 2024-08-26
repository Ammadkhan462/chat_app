import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Profile/callPage/audiocallPage.dart';
import 'package:chat_app/Profile/callPage/videocall.dart';
import 'package:chat_app/Profile/userprofile.dart';
import 'package:chat_app/config/images.dart';
import 'package:chat_app/controller/callController.dart';
import 'package:chat_app/controller/chatcontroller.dart';
import 'package:chat_app/controller/contactcontroller.dart';
import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/models/chatmode.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:chat_app/pages/chat/widget/chat_bubble.dart';
import 'package:chat_app/pages/chat/widget/typemessage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Chatpage extends StatelessWidget {
  final UserModel userModel;
  Chatpage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    // Callcontroller callcontroller = Get.put(Callcontroller());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.to(UserProfilePage(usermodel: userModel));
            },
            child: Row(children: [
              Container(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: userModel.imageUrl != null &&
                          userModel.imageUrl!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: userModel.imageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                      : Image.asset(ImagesAssets.male),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name.toString() ?? "User",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    StreamBuilder(
                        stream: chatcontroller.getStatus(userModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          // if (snapshot.hasError) {
                          //   return Text(
                          //     snapshot.error.toString(),
                          //     style: Theme.of(context).textTheme.labelLarge,
                          //   );
                          // }
                          if (snapshot.data == null) {
                            return Text(
                              " ",
                              style: Theme.of(context).textTheme.labelLarge,
                            );
                          } else {
                            return Text(
                              snapshot.data!.status ?? " ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 92, 133, 112)),
                            );
                          }
                        })
                  ],
                ).paddingOnly(left: 10),
              ),
            ]),
          ),
          actions: [
            // InkWell(
            //   onTap: () {
            //     Get.to(Audiocallpage(target: userModel));
            //     callcontroller.callAction(
            //         userModel, profilecontroller.currentuser.value, "audio");
            //   },
            //   child: Icon(
            //     Icons.call_sharp,
            //     color: Theme.of(context).colorScheme.onPrimary,
            //   ).paddingOnly(right: 10),
            // ),
            // InkWell(
            //   onTap: () {
            //     Get.to(vediocallpage(target: userModel));
            //     callcontroller.callAction(
            //         userModel, profilecontroller.currentuser.value, "video");
            //   },
            //   child: Icon(
            //     Icons.videocam,
            //     color: Theme.of(context).colorScheme.onPrimary,
            //   ).paddingOnly(right: 10),
            // ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 10.0, bottom: 92.0),
              child: StreamBuilder(
                  stream: chatcontroller.getMessages(userModel.id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.data == null) {
                      return Text("no message");
                    } else {
                      return ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          DateTime timestamp =
                              DateTime.parse(snapshot.data![index].timeStamp!);
                          String formatedtime =
                              DateFormat('hh:mm:a').format(timestamp);
                          return ChatBubble(
                            ImageURL: snapshot.data![index].imageUrl ?? "",
                            message: snapshot.data![index].message!,
                            timestamp: formatedtime!,
                            iscoming: snapshot.data![index].receiverId !=
                                profilecontroller.currentuser.value.id,
                            status: "read",
                          );
                        },
                      );
                    }
                  }),
            ),
            Obx(() => chatcontroller.selectedImagePath != ""
                ? Positioned(
                    bottom: 80,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 500,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                              File(chatcontroller.selectedImagePath.value)),
                        ),
                        color: Theme.of(context).colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ))
                : Container())
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Typemessage(
          userModel: userModel,
        ));
  }
}
