import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';

import '../../../linkapi.dart';

class Images extends GetView<ProductDetailsControlllerImp> {
  final ItemsModel? itemsModel = Get.arguments['itemsmodel'];

  Images({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControlllerImp());
    return Scaffold(
      body: GetBuilder<ProductDetailsControlllerImp>(
        builder: (controller) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  
                  
                  enlargeCenterPage: true,
                  aspectRatio: 16/9 ,
                  autoPlayCurve: Curves.fastOutSlowIn ,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8
                ),
                items: [
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                  fit: BoxFit.fill,
                  width: 330,
                  alignment: Alignment.center,
                ),
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                  imageUrl:"${AppLink.imageitems}/${controller.itemsModel.itemsImage2!}",
                  fit: BoxFit.fill,
                  width: 330,
                  alignment: Alignment.center,
                ),
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/${controller.itemsModel.itemsImage3!}",
                  fit: BoxFit.fill,
                  width: 330,
                  alignment: Alignment.center,
                ),
                  )
                ],),
              SizedBox(
                  height: 350,
                  width: 350,
                  child: MaterialButton(
                    onPressed: (() {
                      Get.back();
                    }),
                    child: Text("Back"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
