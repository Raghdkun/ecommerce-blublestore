import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/linkapi.dart';
import 'package:powerecommerce/view/widget/items/productsale.dart';

class ItemImages extends GetView<ProductDetailsControlllerImp> {
  const ItemImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControlllerImp());
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20), top: Radius.circular(20))),
        ),

        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 8,
        //   ),
        //   child: SizedBox(
        //     height: 350,
        //     width: 350,
        //     child: Container(
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Colors.purple[800],
        //       ),
        //     ),
        //   ),
        // ),

        Positioned(
          top: 20,
          child: Hero(
                tag: "${controller.itemsModel.itemsId!}",
                child: CachedNetworkImage(
                  
                  imageUrl:
                      "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                  fit: BoxFit.contain,
                  width: 320,
                  alignment: Alignment.center,
                ),
              ),
        ),
        controller.itemsModel.itemsDescount != 0
            ? ProductSale(
                descount: "${controller.itemsModel.itemsDescount}% ",
                text: "SALE  ")
            : Container(),
      ],
    );
  }
}
