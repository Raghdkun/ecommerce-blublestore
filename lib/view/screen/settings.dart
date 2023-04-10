import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/core/localization/changelocal.dart';
import 'package:powerecommerce/view/widget/customappbar.dart';

import '../../controller/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController setcontroller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text("49".tr),
      ),
      body: Directionality(
        textDirection: translateDataBase(TextDirection.rtl, TextDirection.ltr),
        child: Container(
          child: ListView(
            children: [
              Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: Get.width / 4.1,
                      color: AppColor.customBlack,
                    ),
                    Positioned(
                        top: Get.width / 9,
                        child: const CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 80,
                          ),
                        ))
                  ]),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.toNamed(AppRoute.contactus);
                        },
                        trailing: const Icon(Icons.contact_mail),
                        title: Text("46".tr),
                      ),
                      Divider(),
                      ListTile(
                        trailing: const Icon(Icons.translate),
                        title: Text("47".tr),
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return GetBuilder<LocalLanguage>(
                                builder: (controller) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    height: Get.height / 5,
                                    width: Get.width / 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              backgroundColor:
                                                  AppColor.primaryColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 60,
                                                      vertical: 8)),
                                          onPressed: () {
                                            controller.changelang("Arabic");
                                            Get.defaultDialog(
                                              title: "Language",
                                              middleText:
                                                  "لغتك الآن هي العربية",
                                              onConfirm: () {
                                                Get.offNamed("Settings");
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Arabic",
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: const StadiumBorder(),
                                              backgroundColor:
                                                  AppColor.primaryColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 60,
                                                      vertical: 8)),
                                          onPressed: () {
                                            controller.changelang("English");
                                            Get.defaultDialog(
                                              title: "Language",
                                              middleText:
                                                  "Your Language now is English",
                                              onConfirm: () {
                                                Get.offNamed("Settings");
                                              },
                                            );
                                          },
                                          child: Text(
                                            "English",
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        title: Text("Orders"),
                        trailing: const Icon(
                          Icons.shopping_bag_outlined,
                        ),
                        onTap: () {
                          Get.toNamed(AppRoute.orders);
                        },
                      ),
                      const Divider(),
                      ListTile(
                        title: Text("45".tr),
                        trailing: const Icon(Icons.location_city),
                        onTap: () {
                          Get.toNamed(AppRoute.addressview);
                        },
                      ),
                      const Divider(),
                      ListTile(
                        title: Text("48".tr),
                        trailing: const Icon(Icons.logout_rounded),
                        onTap: () {
                          setcontroller.logout();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
