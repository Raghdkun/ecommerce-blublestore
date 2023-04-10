import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/auth/textformfield.dart';

import '../../../widget/auth/bodytextfield.dart';
import '../../../widget/auth/texttitlefield.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.pink,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "3".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest ,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        TextTitleField(
                          text: "5".tr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BodyTextField(
                          bodytext: "22".tr,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextFormField(
                          isNumber: false,
                          vaild: (val) {
                            return null;
                          
                            // return validInput(val!, 5, 254, "email");
                          },
                          myController: controller.email,
                          hintText: "6".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "7".tr,
                        ),

                        // const Text(
                        //   "Forget Password?",
                        //   textAlign: TextAlign.right,
                        // ),

                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtonAuth(
                          text: "23".tr,
                          onPressed: () {
                            controller.checkemail();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
