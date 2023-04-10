import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/ordersdata.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';

class PendingOrdersController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();

  List<OrdersModel> data = [];

  OrdersModel? ordersModel;

  StatusRequest statusRequest = StatusRequest.none;

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending";
    } else if (val == "1") {
      return "ِAccepted And Processing";
    } else if (val == "2") {
      return "Delivered";
    } else {
      return "Archived";
    }
  }

  refreshNotificationData() {
    data.clear();
    pendingData();
    update();
  }
  refreshData(){
    data.clear();
    pendingData();

  }

  pendingData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .pendingData(myServices.sharedPreferences.getString("id")!);
    print("=============== $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .deleteData(orderid);
    print("=============== $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        pendingData();
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    pendingData();

    update();
    super.onInit();
  }
}
