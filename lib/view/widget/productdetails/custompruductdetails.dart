import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/view/widget/items/customitemscounts.dart';

class CustomProductDetails extends GetView<ProductDetailsControlllerImp> {
  const CustomProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 260,
      width: 390,
      decoration: const BoxDecoration(
          // color: Colors.purple[800],
          // borderRadius: BorderRadius.circular(10)
          ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            GetBuilder<ProductDetailsControlllerImp>(
              builder: (controller) => CustomItemsCount(
                count: "${controller.countitems}",
                onPressedAdd: () {
                  controller.add() ;
                },
                onPressedRemove: () {
                  controller.remove();
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.min,
              children: [
                
                Text(
                  "${translateDataBase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Colors:",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                // const SubItem()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
