import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/string.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/pages/welcome/welcomewidget/welcomefotterbutton.dart';
import 'package:chat_app/pages/welcome/welcomewidget/welcomeheading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
          ),
          WelcomeHeading(),
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesAssets.male),
              SvgPicture.asset(ImagesAssets.connect),
              Image.asset(ImagesAssets.female),
            ],
          ),
          Text(WelcomePage.nowYourAre,
                  style: Theme.of(context).textTheme.headlineMedium)
              .marginOnly(top: 30),
          Text(WelcomePage.connected,
              style: Theme.of(context).textTheme.headlineLarge),
          Text(WelcomePage.discriptiom,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge)
              .paddingAll(10),
          Welcomefotterslider(),
        ],
      )),
    );
  }
}
