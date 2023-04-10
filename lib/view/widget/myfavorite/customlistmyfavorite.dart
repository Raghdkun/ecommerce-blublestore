import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/myfavoritecontroller.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/myfavoritemodel.dart';
import 'package:powerecommerce/linkapi.dart';

class CustomListFavorite extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;
  
  // final bool active;
  const CustomListFavorite(
    this.itemsModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel) ;
      },
      child: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              controller.deleteFromFavorite(itemsModel.favoriteId.toString());
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "${itemsModel.itemsId}",
                  child: CachedNetworkImage(
                      width: 100,
                      imageUrl:
                          "${AppLink.imageitems}/${itemsModel.itemsImage!}",
                      fit: BoxFit.fill,
                      height: 100),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              itemsModel.itemspricedisscount == null
                                  ? Text(
                                      "${itemsModel.itemsPrice} ",
                                      style: const TextStyle(
                                          fontFamily: "sans", fontSize: 16),
                                      textDirection: translateDataBase(
                                          TextDirection.rtl, TextDirection.ltr),
                                      // textDirection:
                                      //     translateDataBase(TextDirection.rtl, TextDirection.ltr),
                                    )
                                  : Text(
                                      "${itemsModel.itemspricedisscount} ",
                                      style: const TextStyle(
                                          fontFamily: "sans", fontSize: 16, color: Color.fromARGB(255, 221, 32, 19)),
                                      textDirection: translateDataBase(
                                          TextDirection.rtl, TextDirection.ltr),
                                      // textDirection:
                                      //     translateDataBase(TextDirection.rtl, TextDirection.ltr),
                                    ),
                              Text(
                                "41".tr,
                                style: const TextStyle(
                                    fontFamily: "sans", fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     controller
                //         .deleteFromFavorite(itemsModel.favoriteId.toString());
                //   },
                //   icon: Icon(Icons.delete),
                //   color: Colors.red[800],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
