import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/binding/initial_binding.dart';

import 'package:powerecommerce/core/localization/translation.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/route.dart';

import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalLanguage controller = Get.put(LocalLanguage());
    return GetMaterialApp(
      
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // darkTheme: themeDark,
      initialBinding: IntialBindings(),
      // home: const Language(),
      // routes: routes,
      getPages: routes,
    );
  }
}
