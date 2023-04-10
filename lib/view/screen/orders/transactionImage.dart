import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/orders/ordersimagecontroller.dart';
import 'package:powerecommerce/linkapi.dart';

class TransactionImage extends StatelessWidget {
  const TransactionImage({super.key});

  @override
  Widget build(BuildContext context) {
    OedersImageController controller = Get.put(OedersImageController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              // width: 200,
              // height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 controller.ordersModel.ordersImage != null ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      imageUrl:
                          "${AppLink.imageserver}/${controller.ordersModel.ordersImage}",
                      // fit: BoxFit.fill,
                      height: 600,
                      // width: 200,
                    ),
                  ) : Text("There is A problem with loading Image , Contact With Support"),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.black,
                    child: Text(
                      "Download",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      controller.saveImage(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
