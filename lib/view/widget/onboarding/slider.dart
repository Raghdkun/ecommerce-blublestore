import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/constant/color.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/datasource/static/static.dart';

class SliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: ((context, i) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const SizedBox(
                //   height: 80,
                // ),
                Image.asset(
                  onBoardingList[i].image!,
                  height: 230,
                  width: Get.width / 1.5 ,
                  fit: BoxFit.fill,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Text(
                  onBoardingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.black),
                ),
                // const SizedBox(
                //   height: 50,
                // ),
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      onBoardingList[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ],
            )));
  }
}
