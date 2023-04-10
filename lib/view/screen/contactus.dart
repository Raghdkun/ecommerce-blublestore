import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/contactuscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.phone),
          onPressed: () async {
            await launchUrl(Uri.parse("tel:+963999223958"));
          },
        ),
        appBar: AppBar(
          title: Text("Contact Us"),
        ),
        body: GetBuilder<ContactUsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [],
              ),
            ),
          ),
        ));
  }
}
