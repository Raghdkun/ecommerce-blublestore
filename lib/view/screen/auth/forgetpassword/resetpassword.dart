import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';

import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/functions/validinput.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../widget/auth/bodytextfield.dart';
import '../../../widget/auth/textformfield.dart';
import '../../../widget/auth/texttitlefield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.pink,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "27".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  TextTitleField(
                    text: "28".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BodyTextField(
                    bodytext: "29".tr,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormField(
                    isNumber: false,
                    vaild: (val) {
                      return validInput(val!, 7, 30, "password");
                    },
                    myController: controller.password,
                    hintText: "8".tr,
                    iconData: Icons.lock_outline,
                    labeltext: "9".tr,
                  ),
                  CustomTextFormField(
                    isNumber: false,
                    vaild: (val) {
                      return validInput(val!, 7, 30, "password");
                    },
                    myController: controller.repassword,
                    hintText: "30".tr,
                    iconData: Icons.lock_outline,
                    labeltext: "32".tr,
                  ),

                  // const Text(
                  //   "Forget Password?",
                  //   textAlign: TextAlign.right,
                  // ),

                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonAuth(
                    text: "31".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
