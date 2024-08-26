import 'package:chat_app/controller/authcontroller.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupform extends StatelessWidget {
  const Signupform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();

    Authcontroller authcontroller = Get.put(Authcontroller());
    return Column(
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Name",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        SizedBox(height: 30),
        Obx(() => authcontroller.isLoading.value
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    ontap: () {
                      String trimmedEmail = email.text.trim();
                      if (trimmedEmail.isEmpty ||
                          password.text.isEmpty ||
                          name.text.isEmpty) {
                        print("Please fill in all fields.");
                        return;
                      }
                      authcontroller.createUser(
                        trimmedEmail,
                        password.text,
                        name.text.trim(),
                      );
                    },
                    btnName: "SIGN UP",
                    icon: Icons.lock_open_outlined,
                  ),
                ],
              ))
      ],
    ).paddingAll(10);
  }
}
