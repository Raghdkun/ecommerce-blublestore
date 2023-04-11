import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

    StatusRequest statusRequest = StatusRequest.none ;


  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, password.text, email.text, phone.text);
      // print("-------------- controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response?['status'] == "success") {
          // data.addAll(response?['data']);
          Get.offNamed(AppRoute.verfiyCodeSignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email Or Phone Number Is Already Exists",
            buttonColor: AppColor.primaryColor ,
            onConfirm: () {
              Get.back();
            },
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      // print("Not Valid");
    }
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
