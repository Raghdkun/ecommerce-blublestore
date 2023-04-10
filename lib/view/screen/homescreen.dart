import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/homescreencontroller.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/view/widget/home/customappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.customBlack,
              onPressed: () {
                Get.toNamed(AppRoute.mycart);
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage))));
  }
}
