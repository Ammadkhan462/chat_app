import 'package:chat_app/Home/widget/chatslist.dart';
import 'package:chat_app/Profile/profilepage.dart';
import 'package:chat_app/config/images.dart';
import 'package:chat_app/config/string.dart';
import 'package:chat_app/Home/widget/tabbar.dart';
import 'package:chat_app/controller/contactcontroller.dart';
import 'package:chat_app/controller/statusController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Contactcontroller contactcontroller = Get.put(Contactcontroller());
    TabController tabController = TabController(length: 3, vsync: this);
    // ProfileController profileController = Get.put(ProfileController());
    // ContactController contactController = Get.put(ContactController());
    // ImagePickerController imagePickerController =
    //     Get.put(ImagePickerController());
    Statuscontroller statusController = Get.put(Statuscontroller());
    // CallController callController = Get.put(CallController());
    // AppController appController = Get.put(AppController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            ImagesAssets.logo,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // appController.checkLatestVersion();
            },
            icon: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                contactcontroller.getchatroomList();
              },
              child: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              Get.toNamed('/profile');
            },
            icon: Icon(
              color: Theme.of(context).colorScheme.primaryContainer,
              Icons.more_vert,
            ),
          )
        ],
        bottom: myTabBar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addcontactpage");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            chatList(),
            // GroupPage(),
            // CallHistory(),
          ],
        ),
      ),
    );
  }
}
