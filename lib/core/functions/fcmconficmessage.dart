import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:ringtone_player/ringtone_player.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/orders/pendingorderscontroller.dart';

RequsetpermisionNotifications() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

FcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("================= notifivation");
    print(message.notification!.title);
    print(message.notification!.body);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotifications(message.data);
    // FlutterRingtonePlayer.playNotification();
    // RingtonePlayer.ringtone(
    //   loop: false,
    // );
  });
}
// inistialdynamiclink() async{
//   final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
//   ProductDetailsControlllerImp controlllerImp = Get.find();
//   // print("______________________ $initialLink");
//   if(initialLink != null ){
//     Get.toNamed("productdetails/${controlllerImp.itemsModel.itemsId}"); 


//   }
// }

refreshPageNotifications(data){
  print(Get.currentRoute);
if(Get.currentRoute  == "/orders" && data['pagename'] == "orders"){
PendingOrdersController controller = Get.find() ;
controller.refreshNotificationData() ;
}
}