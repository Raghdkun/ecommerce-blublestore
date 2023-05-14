import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/favorite_controller.dart';
import 'package:powerecommerce/controller/items_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';
import 'package:powerecommerce/view/widget/items/customategoriesitems.dart';
import 'package:powerecommerce/view/widget/items/customlistitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController favController = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Categries"),
      ),
        body: RefreshIndicator(
          onRefresh: () async  {
           
           favController.update() ;
          },
          child: GetBuilder<ItemsControllerImp>(
              builder: (controller) => ListView(
          children: [
            // CustomAppBarTop(
            //   backicon: Icons.arrow_back,
            //   onpressedback: () {
            //     Get.back();
            //   },
            //   myText: "Categries",
            //   onPressed: () {},
            // ),
            Directionality(
                textDirection:
                    translateDataBase(TextDirection.rtl, TextDirection.ltr),
                child: const CustomCategoriesItems()),
            const SizedBox(
              height: 20,
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8),
                  itemBuilder: ((BuildContext context, index) {
                    favController.isfavorite[controller.data[index]["items_id"]] = controller.data[index]['favorite'] ;
                    return Directionality(
                      textDirection:
                          translateDataBase(TextDirection.rtl, TextDirection.ltr),
                      child: CustomListItems(
                          // active: false,
                          itemsModel:
                              ItemsModel.fromJson(controller.data[index])),
                    );
                  })),
            )
          ],
              ),
            ),
        ));
  }
}
