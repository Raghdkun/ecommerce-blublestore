import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/favorite_controller.dart';
import 'package:powerecommerce/controller/offerscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/view/widget/offers/CustomListItemsoffer.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Offers"),
        ),
        body: GetBuilder<OffersController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: () async {
               await controller.refreshData();
              },
              child: Container(
                  margin: EdgeInsets.symmetric( vertical: 10, ),
                  padding: EdgeInsets.only(top: 10,),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        CustomListItemsOffers(itemsModel: controller.data[index]),
                  )),
            ),
          ),
        ));
  }
}
