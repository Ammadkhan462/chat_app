import 'package:chat_app/config/images.dart';
import 'package:chat_app/controller/authcontroller.dart';
import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel usermodel;
  const UserProfilePage({super.key, required this.usermodel});

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
                  Container(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: usermodel.imageUrl != null &&
                              usermodel.imageUrl!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: usermodel.imageUrl!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Image.asset(ImagesAssets.male),
                    ),
                  ),
                  Text(
                    usermodel.name ?? "user",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).paddingOnly(top: 10),
                  Text(usermodel.email ?? "example@gmail.com",
                      style: Theme.of(context).textTheme.labelLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonIcon(
                        btnname: 'Call',
                        color: Colors.amber, // P1ass a single color value
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
