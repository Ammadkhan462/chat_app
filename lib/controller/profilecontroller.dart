import 'dart:io';
import 'package:chat_app/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class Profilecontroller extends GetxController {
  final store = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  Rx<UserModel> currentuser = UserModel().obs;

  Future<void> getUserDetails() async {
    try {
      DocumentSnapshot userDoc =
          await db.collection("users").doc(auth.currentUser!.uid).get();
      currentuser.value =
          UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
    } catch (e) {
      print("Failed to get user details: $e");
    }
  }

  Future<void> updateDetails(
      String imageUrl, String? name, String? about, String? phoneNumber) async {
    isLoading.value = true;
    try {
      // Create a map to hold the fields to be updated
      Map<String, dynamic> updateData = {};

      // Only add fields to the map if they are provided (i.e., not null)
      if (name != null && name.isNotEmpty) {
        updateData['name'] = name;
      }
      if (about != null && about.isNotEmpty) {
        updateData['about'] = about;
      }
      if (phoneNumber != null && phoneNumber.isNotEmpty) {
        updateData['phoneNumber'] = phoneNumber;
      }
      if (imageUrl.isNotEmpty) {
        String? imageLink = await uploadFileToFirebase(imageUrl);
        if (imageLink != null && imageLink.isNotEmpty) {
          updateData['imageUrl'] = imageLink;
        }
      }

      // Update the user's data in Firestore if there is any data to update
      if (updateData.isNotEmpty) {
        await db
            .collection("users")
            .doc(auth.currentUser!.uid)
            .update(updateData);
      }

      // Refresh the user's details after update
      await getUserDetails();
    } catch (e) {
      print("Failed to update details: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<String?> uploadFileToFirebase(String imagePath) async {
    final file = File(imagePath);
    try {
      final ref = store.ref().child(
          "uploads/${auth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg");
      print("Starting file upload: $imagePath");
      final uploadTask = await ref.putFile(file);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      print("File uploaded: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      print("Failed to upload file: $e");
      return null;
    }
  }
}
