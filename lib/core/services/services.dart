import 'package:firebase_core/firebase_core.dart'; 
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:powerecommerce/core/functions/fcmconficmessage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    
//  String link = 'https://dynamic-link-domain/ke2Qa';


//     FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//   Navigator.pushNamed(context as BuildContext, dynamicLinkData.link.path);
// }).onError((error) {
//   // Handle errors
// });


    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
