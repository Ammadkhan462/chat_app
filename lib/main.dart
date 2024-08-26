import 'package:chat_app/config/pagepath.dart';
import 'package:chat_app/config/theme.dart';
import 'package:chat_app/controller/callController.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/splashpage/splashpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Callcontroller callcontroller = Get.put(Callcontroller());
    return GetMaterialApp(
      title: 'Chat App',
      getPages: pagePath,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: Splashpage(),
    );
  }
}
