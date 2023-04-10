import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/login_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/alertexitapp.dart';
import 'package:powerecommerce/core/functions/validinput.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/auth/logoauth.dart';
import 'package:powerecommerce/view/widget/auth/textformfield.dart';

import '../../widget/auth/bodytextfield.dart';
import '../../widget/auth/textsign.dart';
import '../../widget/auth/texttitlefield.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: AppColor.pink,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "3".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const LogoAuth(),
                            TextTitleField(
                              text: "2".tr,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BodyTextField(
                              bodytext: "38".tr,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextFormField(
                              isNumber: false,
                              vaild: (val) {
                                return validInput(val!, 9, 254, "email");
                              },
                              myController: controller.email,
                              hintText: "6".tr,
                              iconData: Icons.email_outlined,
                              labeltext: "7".tr,
                            ),
                            GetBuilder<LoginControllerImp>(
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
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                "5".tr,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButtonAuth(
                              text: "10".tr,
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextSign(
                              textone: '11'.tr,
                              texttwo: '12'.tr,
                              onTap: () {
                                controller.goToSignUp();
                              },
                            ),
                            // TextSign(
                            //   textone: 'Or You can Go As',
                            //   texttwo: 'Ghust',
                            //   onTap: () {
                            //     Get.toNamed(AppRoute.home); 
                            //   },
                            // )
                          ],
                        ),
                      ),
                    ),)
            )));
  }
}
