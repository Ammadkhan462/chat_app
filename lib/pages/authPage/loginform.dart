import 'package:chat_app/controller/authcontroller.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    Authcontroller authcontroller = Get.put(Authcontroller());
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: password,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Obx(() => authcontroller.isLoading.value
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    ontap: () {
                      authcontroller.login(
                          email.text.trim(), password.text.trim());
                      // Get.offAllNamed("/homepage");
                    },
                    btnName: "LOGIN",
                    icon: Icons.lock_open_outlined,
                  ),
                ],
              ))
      ],
    ).paddingAll(10);
  }
}
