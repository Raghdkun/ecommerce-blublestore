import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/itemscolormode.dart';
import 'package:powerecommerce/data/model/itemssizesmodel.dart';
import 'package:powerecommerce/linkapi.dart';
import 'package:powerecommerce/view/widget/productdetails/itemspriceandcart.dart';

class ProductDetails extends GetView<ProductDetailsControlllerImp> {
  // final ItemsModel itemsModel ;
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
   ProductDetailsControlllerImp controlller = Get.put(ProductDetailsControlllerImp());
    // FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
        bottomNavigationBar: GetBuilder<ProductDetailsControlllerImp>(
          builder: (controller) => ItemsPriceAndCart(),
        ),
        appBar: AppBar(
          centerTitle: true,

          title: const Text(
            "Details",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: (){
              controller.dynamiclinkfirebase(controlller.itemsModel.itemsId); 
            }, icon: Icon(Icons.share))
          ],
          elevation: 0.0,
          // backgroundColor: Colors.deepPurple,
        ),
        body: GetBuilder<ProductDetailsControlllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Directionality(
              textDirection:
                  translateDataBase(TextDirection.rtl, TextDirection.ltr),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListView(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16/9,
                        height: 350,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        

                        
                      ),
                      items: [
                        "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}",
                        "${AppLink.imageitems}/${controller.itemsModel.itemsImage2!}",
                        "${AppLink.imageitems}/${controller.itemsModel.itemsImage3!}"
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric( vertical: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  height: 390,
                                  width: 390,
                                  imageUrl: "$i",
                                  errorWidget: (context, url, error) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                        height: 350,
                                        width: 350,
                                        imageUrl:
                                            "${AppLink.imageitems}/${controller.itemsModel.itemsImage!}"),
                                  ),
                            
                                  // width: 320,
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    if (controller.itemsModel.itemsDescount != 0)
                      Text(
                        "SALE ${controller.itemsModel.itemsDescount}%",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color.fromARGB(255, 175, 24, 13)),
                      ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "${translateDataBase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "${translateDataBase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //     horizontal: 10,
                    //   ),
                    //   child: Text(
                    //     "Available Quantity ${controller.sizesitems[0].itemsvariationsQuantity}",
                    //     textAlign: TextAlign.justify,
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 175, 24, 13),
                    //     ),
                    //   ),
                    // ),
                    if (controller.itemsModel.itemsHascolor == 1)
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text("Choose Color"),
                      ),

                    controller.statusRequest == StatusRequest.success
                        ? Row(
                            children: [
                              ...List.generate(
                                  controller.colorsitems.length,
                                  (index) => ColorsItemList(
                                      controller.colorsitems[index]))
                            ],
                          )
                        : Container(),
                    // if (controller.itemsModel.itemsHassize == 1)
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text("Choose Size"),
                    ),

                    controller.statusRequest == StatusRequest.success
                        ? Row(
                            children: [
                              ...List.generate(
                                  controller.sizesitems.length,
                                  (index) => SizesItemList(
                                      controller.sizesitems[index]))
                            ],
                          )
                        // CustomProductDetails(),
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ColorsItemList extends GetView<ProductDetailsControlllerImp> {
  final ColorsItemsModel subItemsModel;
  const ColorsItemList(this.subItemsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.chooseColor(subItemsModel.itemscolorsName.toString());
      },
      child: Container(
        height: 50,
        width: 85,
        child: Card(
          color: controller.colorName == subItemsModel.itemscolorsName
              ? Colors.grey.shade700
              : null,
          child: Text(
            "${subItemsModel.itemscolorsName}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class SizesItemList extends GetView<ProductDetailsControlllerImp> {
  final SizesItemsModel subItemsModel;

  const SizesItemList(this.subItemsModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.chooseSizes(subItemsModel.itemssizesTitle.toString());
      },
      child: Container(
        height: 50,
        width: 85,
        child: Card(
          color: controller.sizesName == subItemsModel.itemssizesTitle
              ? Colors.grey.shade700
              : null,
          child: Text(
            "${subItemsModel.itemssizesTitle}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
