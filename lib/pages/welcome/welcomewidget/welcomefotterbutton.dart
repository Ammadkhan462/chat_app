import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/string.dart';
import 'package:chat_app/pages/welcome/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:get/get.dart';

class Welcomefotterslider extends StatefulWidget {
  const Welcomefotterslider({super.key});

  @override
  State<Welcomefotterslider> createState() => _WelcomefottersliderState();
}

class _WelcomefottersliderState extends State<Welcomefotterslider> {
  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        Get.offAllNamed('/authpage');
      },
      sliderButtonIcon: SvgPicture.asset(
        ImagesAssets.connect,
      ),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
      text: WelcomePage.slide,
      textStyle: Theme.of(context).textTheme.labelLarge,
    ).paddingAll(10);
  }
}
