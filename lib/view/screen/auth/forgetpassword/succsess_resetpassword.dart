import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/auth/scccsessforgetpassword_controller.dart';

import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/auth/justonetextstyle.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordImp controller = Get.put(SuccessResetPasswordImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pink,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "35".tr,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyCustomTextStyle(mytext: "37".tr),
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            )),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "36".tr,
                onPressed: () {
                  controller.goToLogIn();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
