import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:powerecommerce/controller/orders/pendingorderscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';
import 'package:powerecommerce/view/widget/orders/orderslist.dart';

class OrdersPendings extends StatelessWidget {
  const OrdersPendings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRoute.archivedorders);
                },
                icon: Icon(Icons.archive_outlined))
          ],
          title: Text("Orders"),
        ),
        body: GetBuilder<PendingOrdersController>(
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

class OrdersList extends GetView<PendingOrdersController> {
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
                  trailing: const Icon(
                    Icons.info_outline,
                  ),
                  title: Text("Order Details"),
                  onTap: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": ordersModel});
                  },
                ),
                if (ordersModel.ordersStatus! == 0) Divider(),
                if (ordersModel.ordersStatus! == 0)
                  ListTile(
                    trailing: const Icon(
                      Icons.delete,
                    ),
                    title: Text("Delete Order"),
                    subtitle: Text(
                        "Note: You Can't Delete The Order If The Order Accepted"),
                    onTap: () {
                      Get.defaultDialog(
                        middleText: "Are You Sure?",
                        onConfirm: (){
                          controller.deleteData(ordersModel.ordersId.toString());
                          controller.refreshData();
                          Get.close(0);
                        } ,
                        onCancel: () => Get.closeCurrentSnackbar(),
                      );
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
