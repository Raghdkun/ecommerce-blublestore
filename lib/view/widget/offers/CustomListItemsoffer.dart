import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/favorite_controller.dart';

import 'package:powerecommerce/controller/offerscontroller.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';
import 'package:powerecommerce/linkapi.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                    imageUrl: "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                    fit: BoxFit.fill,
                    height: 140),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        itemsModel.itemspricedisscount != null
                            ? Text(
                                "${itemsModel.itemspricedisscount} ",
                                style: const TextStyle(
                                    fontFamily: "sans", fontSize: 16, color: Color.fromARGB(255, 221, 19, 5)),
                                textDirection: translateDataBase(
                                    TextDirection.rtl, TextDirection.ltr),
                                // textDirection:
                                //     translateDataBase(TextDirection.rtl, TextDirection.ltr),
                              )
                            : Text(
                                "${itemsModel.itemsPrice} ",
                                style: const TextStyle(
                                    fontFamily: "sans", fontSize: 16),
                                textDirection: translateDataBase(
                                    TextDirection.rtl, TextDirection.ltr),
                                // textDirection:
                                //     translateDataBase(TextDirection.rtl, TextDirection.ltr),
                              ),
                        Text(
                          "41".tr,
                          style:
                              const TextStyle(fontFamily: "sans", fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                        onPressed: () {
                          if (controller.isfavorite[itemsModel.itemsId] == 1) {
                            controller.setFavorite(itemsModel.itemsId, 0);
                            controller
                                .removeFavorite(itemsModel.itemsId!.toString());
                          } else {
                            controller.setFavorite(itemsModel.itemsId, 1);
                            controller
                                .addFavorite(itemsModel.itemsId!.toString());
                          }
                        },
                        icon: Icon(
                            controller.isfavorite[itemsModel.itemsId] == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
