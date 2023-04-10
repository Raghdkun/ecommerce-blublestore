import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/addressdata.dart';
import 'package:powerecommerce/data/model/addressmodel.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];
  

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("==================== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        
      }
    }
    update();
  }

  deleteAddress(String addressid) {
    addressData.deleteData(addressid) ;
    data.removeWhere((element) => element.addressId == addressid) ;

  }

  refreshData() {
    getData();

    data.clear();
    update();
  }

  @override
  void onInit() {
    
    getData();
    update();
    super.onInit();
  }
}
