import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/string.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';
class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImagesAssets.logo,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
