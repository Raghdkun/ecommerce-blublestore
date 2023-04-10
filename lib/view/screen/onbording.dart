import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/onboarding_controller.dart';
import 'package:powerecommerce/view/widget/onboarding/slider.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/dotcontroller.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: SliderOnBoarding()
          ),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                   Padding(
                     padding: EdgeInsets.all(25.0),
                     child: DotControllerOnboardeing(),
                   ),
                   Spacer(flex: 1),
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: CustomButtonOnBoarding(),
                   )
                ],
              ))
        ],
      ),
    ));
  }
}
