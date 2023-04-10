import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/notificationsdata.dart';
import 'package:powerecommerce/data/model/notificationsmodel.dart';

class NotificationsController extends GetxController {
 late StatusRequest statusRequest ;

  MyServices myServices = Get.find(); 
NotificationsData notificationsData = NotificationsData(Get.find()); 

  List<NotificationsModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============== $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => NotificationsModel.fromJson(e)));
      } else {
        
      }
    }
    update();
  }


@override
  void onInit() {
    getData();
    update();
    super.onInit();
  }
  
}