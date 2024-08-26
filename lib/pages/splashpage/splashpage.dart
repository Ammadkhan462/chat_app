import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/pagepath.dart';
import 'package:chat_app/controller/authcontroller.dart';
import 'package:chat_app/controller/splashcontroller.dart';
import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splashpage extends StatelessWidget {
  Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    Splashcontroller splashcontroller = Get.put(Splashcontroller());
    return Center(
      child: SvgPicture.asset(ImagesAssets.logo),
    );
  }
}
