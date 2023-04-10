import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';

import 'package:powerecommerce/data/datasource/remote/offersdata.dart';

import 'package:powerecommerce/data/model/itemsmodel.dart';

class OffersController extends GetxController {
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  OffersData offersdata = OffersData(Get.find());

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await offersdata.getData();
    print("==================== address $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }




  refreshData() {
    statusRequest = StatusRequest.loading ; 
    data.clear();
    getData();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    refreshData();
    super.onInit();
  }
}
