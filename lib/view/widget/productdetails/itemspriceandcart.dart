import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';

class ItemsPriceAndCart extends GetView<ProductDetailsControlllerImp> {
  
  const ItemsPriceAndCart({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(FavoriteController());
    return Container(
      height: Get.height / 7.6,
      child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                controller.itemsModel.itemspricedisscount == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.itemsModel.itemsPrice} ",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            "41".tr,
                            style: const TextStyle(
                                fontFamily: "sans",
                                fontSize: 14,
                                color: Colors.black),
                            textDirection: translateDataBase(
                                TextDirection.rtl, TextDirection.ltr),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Text(
                                  controller.itemsModel.itemspricedisscount != 0
                                      ? "${controller.itemsModel.itemspricedisscount} "
                                      : "${controller.itemsModel.itemsPrice} ",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  "41".tr,
                                  style: const TextStyle(
                                      fontFamily: "sans",
                                      fontSize: 14,
                                      color: Colors.black),
                                  textDirection: translateDataBase(
                                      TextDirection.rtl, TextDirection.ltr),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColor.customBlack,
                  onPressed: () {
                    controller.add();
                    controller.cartController.refreshPage();

                   
                    controller.cartController.refreshPage();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
