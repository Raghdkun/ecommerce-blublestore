import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/auth/signup_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/functions/alertexitapp.dart';
import 'package:powerecommerce/core/functions/validinput.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/auth/textformfield.dart';


import '../../widget/auth/bodytextfield.dart';
import '../../widget/auth/textsign.dart';
import '../../widget/auth/texttitlefield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          
          title: Text(
            "21".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
              builder: (controller) =>
             HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      TextTitleField(
                        text: "13".tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BodyTextField(
                        bodytext: "14".tr,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormField(
                        isNumber: false,
                        vaild: (val) {
                          return validInput(val!, 5, 254, "email");
                        },
                        myController: controller.email,
                        hintText: "6".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "7".tr,
                      ),
                      CustomTextFormField(
                        isNumber: false,
                        vaild: (val) {
                          return null;
                        
                           
                        },
                        myController: controller.username,
                        hintText: "16".tr,
                        iconData: Icons.person_outlined,
                        labeltext: "15".tr,
                      ),
                      CustomTextFormField(
                        isNumber: true,
                        vaild: (val) {
                          return validInput(val!, 10, 13, "Phone");
                        },
                        myController: controller.phone,
                        hintText: "18".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "17".tr,
                      ),
                      GetBuilder<SignUpControllerImp>(
                        builder: (controller) => CustomTextFormField(
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          obscureText: controller.isShowPassword,
                          isNumber: false,
                          vaild: (val) {
                            return validInput(val!, 7, 30, "password");
                          },
                          myController: controller.password,
                          hintText: "8".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "9".tr,
                        ),
                      ),
                      // const Text(
                      //   "Forget Password?",
                      //   textAlign: TextAlign.right,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButtonAuth(
                        text: "12".tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextSign(
                        textone: '20'.tr,
                        texttwo: '19'.tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ],
                  ),
                ),
              ))
  ),),);
  }
}
