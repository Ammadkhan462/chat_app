import 'package:chat_app/pages/authPage/loginform.dart';
import 'package:chat_app/pages/authPage/signuppage.dart';
import 'package:chat_app/pages/welcome/welcomewidget/welcomeheading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';

class PageAuth extends StatelessWidget {
  const PageAuth({super.key});

  @override
  Widget build(BuildContext context) {
    
    RxBool isLogin = true.obs;
    return Scaffold(
      body: SingleChildScrollView(
        // Added SingleChildScrollView here
        child: Column(
          children: [
            WelcomeHeading().paddingOnly(top: 50),
            Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                     splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
                                  onTap: () {
                                    isLogin.value = true;
                                  },
                                  child: Column(
                                    children: [
                                      Text('Login',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge)
                                          .paddingOnly(top: 20),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: isLogin.value ? 100 : 0,
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                     splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
                                  onTap: () {
                                    isLogin.value = false;
                                  },
                                  child: Column(
                                    children: [
                                      Text('Signup',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge)
                                          .paddingOnly(top: 20),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: isLogin.value ? 0 : 100,
                                        height: 5,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Obx(() =>
                            isLogin.value == true ? LoginForm() : Signupform())
                      ],
                    ))
                  ],
                )).paddingAll(20)
          ],
        ),
      ),
    );
  }
}
