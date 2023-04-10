import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: AppColor.pink,
            textStyle: Theme.of(context).textTheme.displayLarge,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8)),
        onPressed: () {
          controller.next();
        },
        child:  Text("4".tr),
      ),
    );
  }
}
