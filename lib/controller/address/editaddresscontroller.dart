import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';

import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/addressdata.dart';

class EditAddressController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? shipping;

  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.editData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        shipping!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.defaultDialog(
          title: "Address Info",
          middleText: "Your Your Address Has Been Changed",
          onConfirm: () {
            Get.offNamed("addressview");
          },
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshButton() {
    city!.clear();
    update();
  }

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    shipping = TextEditingController();

    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    shipping = TextEditingController();

    update();
    super.onInit();
  }

  // @override
  // void dispose() {
  //   name!.dispose();
  //   city!.dispose();
  //   shipping!.dispose();
  //   super.dispose();
  // }
}
