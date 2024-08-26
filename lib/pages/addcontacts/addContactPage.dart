import "package:chat_app/config/images.dart";
import "package:chat_app/controller/chatcontroller.dart";
import "package:chat_app/controller/contactcontroller.dart";
import "package:chat_app/controller/profilecontroller.dart";
import "package:chat_app/pages/addcontacts/widgets/addcontacttiles.dart";
import "package:chat_app/pages/chat/chatpage.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Addcontactpage extends StatelessWidget {
  Addcontactpage({super.key});

  @override
  Widget build(BuildContext context) {
    Chatcontroller chatcontroller = Get.put(Chatcontroller());
    Contactcontroller contactcontroller = Get.put(Contactcontroller());
    Profilecontroller profilecontroller = Get.put(Profilecontroller());
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contacts',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Total 234 contacts',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), // Add the desired icon here

                    hintText: 'Search contacts',
                  ),
                )),
              ],
            ),
          ).paddingAll(15),
          addContactile(
            name: 'New Contact',
            icondata: Icons.person_add_alt_rounded,
          ).paddingOnly(top: 15, left: 15, right: 15, bottom: 10),
          addContactile(
            name: 'New Group',
            icondata: Icons.person_add_alt_rounded,
          ).paddingOnly(right: 15, left: 15),
          Text('Contacts on Snapchat',
                  style: Theme.of(context).textTheme.labelLarge)
              .paddingOnly(left: 15),
          Obx(
            () => Column(
              children: contactcontroller.userList
                  .map(
                    (e) => InkWell(
                         splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
                      onTap: () {
                        String roomId = chatcontroller.getRoomId(e.id!);
                        print(roomId);
                        Get.to(Chatpage(
                          userModel: e,
                        ));
                      },
                      child: MemberTitle(
                        name: e.name ?? 'Ammad Khan',
                        description: e.about ?? '',
                        imageUrl: e.imageUrl, // Pass the image URL or null
                        who: e.email ==
                                profilecontroller.currentuser!.value.email
                            ? "YOU"
                            : "",
                      ).paddingOnly(right: 15, left: 15, top: 10),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class addContactile extends StatelessWidget {
  final String name;
  final IconData icondata;

  // Updated constructor to require name, description, and assetImage
  addContactile({
    required this.name,
    required this.icondata,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
            child: Icon(icondata),
          ).paddingAll(10),
          Expanded(
              child: Text(
            name,
            style: Theme.of(context).textTheme.bodyLarge,
          ).paddingOnly(left: 10)),
        ],
      ),
    );
  }
}
