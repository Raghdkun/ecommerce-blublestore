import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/ordersdetailsdata.dart';
import 'package:powerecommerce/data/model/cartmodel.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  late StatusRequest statusRequest;
  late CartModel cartModel ;
  MyServices myServices = Get.find();
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  getAddressData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersDetailsData
        .getData(ordersModel.ordersId!.toString());
    print("==================== address $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getAddressData();
    super.onInit();
  }
}
