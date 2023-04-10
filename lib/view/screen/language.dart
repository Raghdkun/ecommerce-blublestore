import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/constant/routes.dart';

import '../../core/localization/changelocal.dart';
import '../widget/language/languagebutton.dart';

class Language extends GetView<LocalLanguage> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Language".tr,
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(
              height: 50,
            ),
            LanguageButton(
              textbutton: "العربية",
              onPressed: () {
                controller.changelang("Arabic");
                Get.toNamed(AppRoute.onboarding);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            LanguageButton(
              textbutton: "English",
              onPressed: () {
                controller.changelang("English");
                Get.toNamed(AppRoute.onboarding);

              },
            )
          ],
        ),
      ),
    );
  }
}
