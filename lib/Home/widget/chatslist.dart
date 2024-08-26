import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Home/widget/chatslist.dart';
import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/string.dart';
import 'package:chat_app/Home/widget/tabbar.dart';
import 'package:chat_app/controller/chatcontroller.dart';
import 'package:chat_app/controller/contactcontroller.dart';
import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:chat_app/pages/chat/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class chatList extends StatelessWidget {
  const chatList({super.key});

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    Contactcontroller contactcontroller = Get.put(Contactcontroller());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    return RefreshIndicator(
      onRefresh: () {
        return contactcontroller.getchatroomList();
      },
      child: Obx(
        () => ListView(
          children: contactcontroller.chatroommodel
              .map(
                (e) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.to(Chatpage(
                        userModel: (e.reciever!.id ==
                                profilecontroller.currentuser.value.id
                            ? e.sender
                            : e.reciever)!)); // Navigate to the chat screen
                  },
                  child: ChatTitle(
                    name: (e.reciever!.id ==
                                profilecontroller.currentuser.value.id
                            ? e.sender!.name
                            : e.reciever!.name) ??
                        "unknown",
                    description: 'Last message ${e.lastmessage!}',
                    imageUrl: (e.reciever!.id ==
                            profilecontroller.currentuser.value.id
                        ? e.sender!.imageUrl
                        : e.reciever!.imageUrl),
                    time: e.lastmessagetimestamp.toString(),
                    // Pass the image asset here
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ChatTitle extends StatelessWidget {
  final String name;
  final String description;
  String time;
  final String? imageUrl;

  // Updated constructor to require name, description, and assetImage
  ChatTitle({
    required this.name,
    required this.description,
    required this.time,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        print("Error loading image: $error");
                        return Icon(Icons.error);
                      },
                    )
                  : Image.asset(ImagesAssets.male),
            ),
          ).paddingOnly(left: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Flexible(
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow:
                        TextOverflow.ellipsis, // Ensures text doesn't overflow
                  ),
                ),
              ],
            ).paddingOnly(top: 20, left: 10),
          ),
          Text(
            time,
            style: Theme.of(context).textTheme.labelLarge,
          ).paddingOnly(left: 8, right: 10), // Added right padding
        ],
      ),
    );
  }
}
