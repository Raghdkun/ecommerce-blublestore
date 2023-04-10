import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:powerecommerce/controller/notificationscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/data/model/notificationsmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications History"),
        ),
        body: GetBuilder<NotificationsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: ListView(
                      children: [
                        ...List.generate(
                            controller.data.length,
                            (index) => NotificationsWidget(
                                  notificationsModel: controller.data[index],
                                ))
                      ],
                    ),
                  ),
                )));
  }
}

class NotificationsWidget extends StatelessWidget {
  final NotificationsModel notificationsModel;
  const NotificationsWidget({super.key, required this.notificationsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ListView(
        children: [
          Card(
            // color: Colors.grey.shade300,
            child: ListTile(
              splashColor: Colors.grey.shade300,
              style: ListTileStyle.drawer,
              tileColor: Colors.grey.shade300,
              trailing: Stack(
                fit: StackFit.passthrough,
                // alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: Colors.black54,
                  ),
                  Badge(
                    largeSize: 16,
                    isLabelVisible: true,
                    backgroundColor: Colors.black,
                    child: Card(), //you can replace with your widget
                    label: Text(
                      "${notificationsModel.notificationId}",
                      textAlign: TextAlign.start,
                    ),
                    // position: BadgePosition.topStart(),
                  )
                ],
              ),
              dense: true,
              leading: Text(
                "${Jiffy(notificationsModel.notificationDatetime, "yyyy-MM-dd").fromNow()}",
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
              ),
              title: Text(
                "${notificationsModel.notificationTitle}",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.right,
              ),
              subtitle: Text(
                "${notificationsModel.notificationBody}",
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
