import 'package:chat_app/config/images.dart';
import 'package:chat_app/controller/Imagepicker.dart';
import 'package:chat_app/controller/chatcontroller.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Typemessage extends StatelessWidget {
  final UserModel userModel;

  Typemessage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    RxString message = "".obs;
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    ImagepickerController imagepickerController =
        Get.put(ImagepickerController());

    TextEditingController messagecontroller = TextEditingController();

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Icon(
            Icons.emoji_emotions_outlined,
            color: Theme.of(context).colorScheme.primaryContainer,
          ).marginAll(5),
          Expanded(
              child: TextField(
            onChanged: (value) {
              message.value = value;
            },
            controller: messagecontroller,
            decoration: InputDecoration(
                filled: false,
                hintText: 'Type Message ...',
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primaryContainer)),
          )),
          Obx(
            () => chatcontroller.selectedImagePath.value == ""
                ? InkWell(
                    onTap: () async {
                      chatcontroller.selectedImagePath.value =
                          await imagepickerController.PickImage();
                    },
                    child: SvgPicture.asset(ImagesAssets.gallery).marginAll(5))
                : InkWell(
                    onTap: () async {
                      chatcontroller.selectedImagePath.value = "";
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ).marginAll(5)),
          ),
          Obx(
            () => message.value.isEmpty &&
                    chatcontroller.selectedImagePath.value.isEmpty
                ? SvgPicture.asset(ImagesAssets.mic).marginAll(5)
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messagecontroller.text.isNotEmpty ||
                          chatcontroller.selectedImagePath.value.isNotEmpty)
                        chatcontroller.sendMessage(
                            userModel.id!, messagecontroller.text, userModel);
                      messagecontroller.clear();
                      message.value = "";
                    },
                    child: Container(
                            width: 30,
                            height: 30,
                            child: chatcontroller.isLoading.value
                                ? CircularProgressIndicator()
                                : SvgPicture.asset(ImagesAssets.sendmessage))
                        .marginAll(5),
                  ),
          ),
        ],
      ).paddingAll(5),
    );
  }
}
