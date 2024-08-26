import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/config/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool iscoming;
  final String ImageURL;
  final String timestamp;
  final String status;
  ChatBubble(
      {super.key,
      required this.message,
      required this.iscoming,
      required this.ImageURL,
      required this.timestamp,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          iscoming ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
                padding: EdgeInsets.all(10),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width / 1.3),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: iscoming
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                        : BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                child: ImageURL == ""
                    ? Text(
                        message,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(imageUrl: ImageURL!)),
                          message == ""
                              ? Container()
                              : Text(
                                  message,
                                ).marginOnly(top: 10)
                        ],
                      ))
            .paddingOnly(left: 10, top: 20, right: 10),
        Row(
          mainAxisAlignment:
              iscoming ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            iscoming
                ? Row(
                    children: [
                      Text(
                        timestamp,
                        style: Theme.of(context).textTheme.labelMedium,
                      ).paddingOnly(right: 8),
                      SvgPicture.asset(
                        ImagesAssets.status,
                        width: 12,
                        height: 12,
                      ),
                    ],
                  )
                : Text(
                    timestamp,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
          ],
        ).paddingOnly(left: 10, top: 10, right: 10),
      ],
    );
  }
}
