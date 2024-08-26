import 'package:chat_app/Home/homepage.dart';
import 'package:chat_app/Profile/profilepage.dart';
import 'package:chat_app/Profile/updateprofile/updateprofile.dart';
import 'package:chat_app/models/usermodel.dart';
import 'package:chat_app/pages/addcontacts/addContactPage.dart';
import 'package:chat_app/pages/chat/chatpage.dart';
import 'package:get/get.dart';
import 'package:chat_app/pages/authPage/authpage.dart';

var pagePath = [
  GetPage(
      name: '/authpage',
      page: () => PageAuth(),
      transition: Transition.leftToRight),
  GetPage(name: '/homepage', page: () => HomePage()),
  GetPage(name: '/profile', page: () => ProfilePage()),
  GetPage(name: '/updateprofile', page: () => Updateprofile()),
  GetPage(name: '/addcontactpage',page: ()=>Addcontactpage())
];
