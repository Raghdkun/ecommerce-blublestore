import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/ordersdata.dart';
import 'package:powerecommerce/data/datasource/remote/rating/ordersarchiveratingdata.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';

class ArchiveOrderController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  OrdersArchiveRatingData ordersArchiveRatingData =
      OrdersArchiveRatingData(Get.find());

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
    archivedData();
    update();
  }

  submitRating(String id, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersArchiveRatingData.getData(id, rating.toString(), comment);
    print("=============== $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
         Get.defaultDialog(
        title: "Message",
        middleText: "Thank You So Much!!",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
      archivedData();
        // Get.offAllNamed(AppRoute.archivedorders);
        // data.addAll(response['data']);
        // List responsedata = response['data'];
        // data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  archivedData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .archiveData(myServices.sharedPreferences.getString("id")!);
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

  @override
  void onInit() {
    archivedData();

    update();
    super.onInit();
  }
}
