import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/pagepath.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UpdatUsereprofile extends StatelessWidget {
  const UpdatUsereprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )),
          title: Text(
            'Update AppBar',
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                          ),
                        ),
                        Text(
                          'Personal Info',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: 10),
                        Text('Name').paddingOnly(right: 280, bottom: 5),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Phone Number').paddingOnly(right: 210, bottom: 5),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Email').paddingOnly(right: 280, bottom: 5),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter your email address',
                          ),
                        ),
                        SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(btnName: 'Save', icon: Icons.save),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ).paddingOnly(top: 20, right: 15, left: 15)
          ],
        ),
      
    );
  }
}
