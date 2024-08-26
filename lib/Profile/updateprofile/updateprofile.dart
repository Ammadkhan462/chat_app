import 'dart:io';

import 'package:chat_app/controller/Imagepicker.dart';
import 'package:chat_app/controller/profilecontroller.dart';
import 'package:chat_app/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Updateprofile extends StatelessWidget {
  const Updateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    TextEditingController nameController =
        TextEditingController(text: profilecontroller.currentuser.value.name);
    TextEditingController phoneNumberController = TextEditingController(
        text: profilecontroller.currentuser.value.phoneNumber);
    TextEditingController aboutController =
        TextEditingController(text: profilecontroller.currentuser.value.about);
    TextEditingController emailController =
        TextEditingController(text: profilecontroller.currentuser.value.email);
    ImagepickerController imagePicker = Get.put(ImagepickerController());
    RxString imagePath = "".obs;

    // Rx variables to track the edit state of fields
    var nameFieldEdit = false.obs;
    var phoneFieldEdit = false.obs;
    var aboutFieldEdit = false.obs;
    var emailFieldEdit = false.obs;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        actions: [
          InkWell(
               splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
            onTap: () {
              Get.offAllNamed('/authpage');
            },
            child: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          )
        ],
        title: Text(
          'Update Profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                    child: InkWell(
                         splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
                      onTap: () async {
                        imagePath.value = await imagePicker.PickImage();
                      },
                      child: Obx(
                        () {
                          final imageUrl = imagePath.value.isNotEmpty
                              ? imagePath.value
                              : profilecontroller.currentuser.value.imageUrl;

                          return imageUrl == null || imageUrl.isEmpty
                              ? Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: imagePath.value.isNotEmpty
                                      ? Image.file(
                                          File(imagePath.value),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                );
                        },
                      ),
                    )),
                Text(
                  'Personal Info',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 10),
                EditableTextField(
                  labelText: 'Name',
                  controller: nameController,
                  isEdit: nameFieldEdit,
                ),
                const SizedBox(height: 10),
                EditableTextField(
                  labelText: 'Phone Number',
                  controller: phoneNumberController,
                  isEdit: phoneFieldEdit,
                ),
                const SizedBox(height: 10),
                EditableTextField(
                  labelText: 'About',
                  controller: aboutController,
                  isEdit: aboutFieldEdit,
                ),
                const SizedBox(height: 10),
                EditableTextField(
                  showEditIcon: false,
                  labelText: 'Email',
                  controller: emailController,
                  isEdit: emailFieldEdit,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => profilecontroller.isLoading.value
                      ? CircularProgressIndicator()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                                ontap: () {
                                  // Check if any field is still in edit mode
                                  if (nameFieldEdit.value ||
                                      phoneFieldEdit.value ||
                                      aboutFieldEdit.value ||
                                      emailFieldEdit.value) {
                                    Get.snackbar('Error',
                                        'Please confirm all fields before saving.');
                                    return;
                                  }
                                  profilecontroller.updateDetails(
                                    imagePath.value,
                                    nameController.text,
                                    phoneNumberController.text,
                                    aboutController.text,
                                  );
                                },
                                btnName: 'Save',
                                icon: Icons.save),
                          ],
                        ),
                ),
              ],
            ),
          ).paddingOnly(top: 20, right: 15, left: 15),
        ],
      ),
    );
  }
}

class EditableTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool showEditIcon; // Control whether the edit icon is shown
  final RxBool isEdit; // Expose the edit state

  EditableTextField({
    required this.labelText,
    required this.controller,
    required this.isEdit,
    this.showEditIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextField(
        readOnly: !isEdit.value,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              // Toggle the isEdit value
              isEdit.value = !isEdit.value && showEditIcon;
            },
            icon: showEditIcon
                ? Icon(
                    isEdit.value ? Icons.check : Icons.edit,
                    color: Colors.blue,
                  )
                : Icon(Icons.no_encryption),
          ),
          fillColor: !isEdit.value
              ? Theme.of(context).colorScheme.onSurface
              : Theme.of(context).colorScheme.surface,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
