import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:powerecommerce/controller/orders/archivecontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';
import 'package:powerecommerce/view/screen/orders/orders.dart';
import 'package:powerecommerce/view/screen/orders/ratingdialog.dart';

class ArchivedOrders extends StatelessWidget {
  final bool? isActive;
  const ArchivedOrders({super.key, this.isActive});

  @override
  Widget build(BuildContext context) {
    ArchiveOrderController controller = Get.put(ArchiveOrderController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Archived Orders"),
        ),
        body: GetBuilder<ArchiveOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.only(top: 10),
              child: ListView(
                children: [
                  ...List.generate(
                    controller.data.length,
                    (index) => OrdersList(ordersModel: controller.data[index]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class OrdersList extends GetView<ArchiveOrderController> {
  final OrdersModel ordersModel;
  const OrdersList({
    super.key,
    required this.ordersModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Colors.grey[50],
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  trailing: Text(
                    "${Jiffy(ordersModel.ordersDateime, "yyyy-MM-dd").fromNow()}",
                    style: TextStyle(
                        color: AppColor.customBlack,
                        fontWeight: FontWeight.w400),
                  ),
                  title: Text("Order Number : ${ordersModel.ordersId}"),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_circle_left,
                  ),
                  title: Text(
                      "Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus.toString())}"),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.price_check,
                  ),
                  title: Text(
                      "Order Total Price : ${ordersModel.ordersTotalprice}"),
                ),
                Divider(),
                ListTile(
                  trailing: const Icon(
                    Icons.image,
                  ),
                  title: Text("Order Transaction Image"),
                  onTap: () {
                    Get.toNamed(AppRoute.transactionimage,
                        arguments: {"ordersmodel": ordersModel});
                  },
                ),
                Divider(),
                ListTile(
                  trailing: ordersModel.ordersRating == 0 ?  MaterialButton(
                        color: Colors.grey.shade700,
                        onPressed: () {
                          ratingDialog(context, ordersModel.ordersId.toString());
                          controller.refreshNotificationData(); 
                        },
                        child: Text("Rate", style: TextStyle(color: Colors.white),),
                      ):  Icon(
                    Icons.info_sharp,
                  ), 
                  title: Text("Order Details"),
                  onTap: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": ordersModel});
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
