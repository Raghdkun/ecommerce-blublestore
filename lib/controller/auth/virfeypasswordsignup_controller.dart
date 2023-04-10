

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerfiyPasswordSignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}



class VerfiyPasswordSignUpControllerImp extends VerfiyPasswordSignUpController {
  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? email;

  @override
  checkcode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await verfiyCodeSignUpData.postData(email!, verfiyCodeSignUp);
    // print("-------------- controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response?['status'] == "success") {
        // data.addAll(response?['data']);
        Get.toNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verfiy Code Is Not Correct!",
          buttonColor: AppColor.primaryColor,
          textConfirm: "Ok",
          onConfirm: () {
            Get.back();
          },
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments["email"];

    //   super.onInit();
    // }
  }

  reSend() {
    verfiyCodeSignUpData.resendData(
      email!,
    );

    Get.rawSnackbar(
        title: "Verfiy Code Sended",
        messageText: const Text("Please Check Your Email Again"));
  }
  
}
