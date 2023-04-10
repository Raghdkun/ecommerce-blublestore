import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/home_controller.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';
import 'package:powerecommerce/linkapi.dart';

class DisscountProducts extends GetView<HomeControllerImp> {
  const DisscountProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      child: controller.items != null ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 0.7),
        itemCount: controller.items.length,
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return DiscountItems(
              itemsmodel: ItemsModel.fromJson(controller.items[i]),
            );
        },
      ) : null,
    );
  }
}

class DiscountItems extends GetView<HomeControllerImp> {
  final ItemsModel itemsmodel;
  const DiscountItems({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsmodel);
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  // height: 120,
                  // width: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     border: Border.all(color: AppColor.customBlack, width: 2)),
                  // child: Image.asset(
                  //   AppImageAsset.items,
                  //   height: 200,
                  //   width: 200,
                  //   fit: BoxFit.fill,
                  // ),
                  child: Image.network(
                    "${AppLink.imageitems}/${itemsmodel.itemsImage}",
                    fit: BoxFit.fill,
                    width: 110,
                    height: 110,
                  ),
                ),
              ],
            ),
            Text(
              "${translateDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
            // Text(
            //   "${itemsmodel.itemsDescount}% Disscount",
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(color: Colors.redAccent),
            // ),
          ],
        ));
  }
}


// Container(
//             alignment: Alignment.center,
//             height: 120,
//             width: 150,
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             margin: const EdgeInsets.symmetric(horizontal: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: AppColor.customBlack, width: 2)),
//             // child: Image.asset(
//             //   AppImageAsset.items,
//             //   height: 200,
//             //   width: 200,
//             //   fit: BoxFit.fill,
//             // ),
//             child: Image.network(
//                 "${AppLink.imageitems}/${itemsmodel.itemsImage}",
//                 fit: BoxFit.fill),
//           ),


// Text(
//               "${translateDataBase(itemsmodel.itemsNameAr, itemsmodel.itemsName)}",
//               textAlign: TextAlign.center,
//               style: TextStyle(),
//             ),

// Text(
//               "${itemsmodel.itemsDescount}% Disscount",
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.red),
//             ),