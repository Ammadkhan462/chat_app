import 'package:chat_app/config/images.dart';
import 'package:chat_app/controller/authcontroller.dart';
import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.put(Profilecontroller());

    Authcontroller authcontroller = Get.put(Authcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: InkWell(
             splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
               splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
              onTap: () {
                Get.toNamed('/updateprofile');
              },
              child:
                  Icon(Icons.edit, color: Colors.white).paddingOnly(right: 10))
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 370,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).colorScheme.onSurface),
              child: Column(
                children: [
                  Image.asset(ImagesAssets.male),
                  Obx(
                    () => Text(
                      profilecontroller.currentuser.value.email ??
                          "example@gmail.com",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ).paddingOnly(top: 10),
                  ),
                  Obx(
                    () => Text(
                        profilecontroller.currentuser.value.name ?? 'User',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonIcon(
                        btnname: 'Call',
                        color: Colors.amber, // Pass a single color value
                        iconname: Icons.call,
                      ),
                      ButtonIcon(
                        btnname: 'Chat',
                        color: const Color.fromARGB(
                            255, 51, 51, 190), // Pass a single color value
                        iconname: Icons.call,
                      ),
                      ButtonIcon(
                        btnname: 'Delete',
                        color: Colors.red,
                        iconname: Icons.delete,
                      ),
                    ],
                  ).paddingOnly(top: 30),
                ],
              ).paddingOnly(top: 50),
            ).paddingOnly(top: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  ontap: authcontroller.logout,
                  btnName: 'Logout',
                  icon: Icons.logout,
                  color: Colors.red,
                ),
              ],
            ).paddingOnly(top: 100),
          ],
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final String btnname;
  final Color color; // Change to Color
  final IconData iconname;

  ButtonIcon({
    super.key,
    required this.btnname,
    required this.iconname,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110, // Ensure there is enough space
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconname, color: color),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              btnname,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 17,
                    color: color, // Apply the color to the text
                  ),
            ),
          ),
        ],
      ).paddingAll(13),
    );
  }
}
