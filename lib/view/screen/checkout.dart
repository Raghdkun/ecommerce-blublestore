import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/checkoutcontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/checkout/addresscheckout.dart';
import 'package:powerecommerce/view/widget/checkout/pickimage.dart';

class CheckOut extends StatelessWidget {
  final String? totalPrice;

  const CheckOut({super.key, this.totalPrice});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    // Get.put(ViewAddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(children: [
                PickImage("Select From library", "Transaction Image Selected!"),
                SizedBox(
                  height: 10,
                ),
                translateDataBase(
                    Text("المجموع ${controller.totalallprice.toString()} ل.س"),
                    Text(
                        "Your Total is ${controller.totalallprice.toString()} S.P")),
                Text("Click on Address To Choose It "),
                controller.address.isEmpty
                    ? Container(
                        child: Column(
                          children: [
                            Text(
                              "You Can't Complete Your Payment Without Adding Address",
                              textAlign: TextAlign.center,
                            ),
                            MaterialButton(
                              color: AppColor.customBlack,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              onPressed: () {
                                Get.offNamed(AppRoute.addressadd);
                              },
                              child: Text(
                                "Add Address",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                ...List.generate(
                  controller.address.length,
                  (index) => InkWell(
                    onTap: () {
                      controller.chooseAddress(
                          controller.address[index].addressId!.toString());
                      print("true");
                    },
                    child: GetBuilder<CheckoutController>(
                      builder: (controller) => AddressCheckOut(
                          nameEn: "${controller.address[index].addressName!}",
                          nameAR: "${controller.address[index].addressName!}",
                          cityAr: "${controller.address[index].addressCity!}",
                          cityEn: "${controller.address[index].addressCity!}",
                          ShippingEn:
                              "${controller.address[index].addressShipping!}",
                          ShippingAr:
                              "${controller.address[index].addressShipping!}",
                          isActive: controller.addressId.toString() ==
                              controller.address[index].addressId!.toString()),
                    ),
                  ),
                ),
                controller.addressId != null && controller.file != null
                    ? CustomButtonAuth(
                        text: "Place Order",
                        onPressed: () {
                          controller.insertData();
                          controller.upload();
                        },
                      )
                    : CustomButtonAuth(
                        text: "Place Order",
                        onPressed: () {
                          controller.checkData();
                        },
                      )
              ]),
            ),
          ),
        ));
  }
}

// MaterialButton(
//             onPressed: () {
//               controller.pickImageFromGallory();
//               // controller.pickImageFromCamera();
//             },
//             child: Text("pickImage"),
//           ),
//           GetBuilder<CheckoutController>(
//             builder: (controller) => controller.file != null
//                 ? Image.file(
//                     controller.file!,
//                     width: 400,
//                     height: 400,
//                   )
//                 : Container(),
//           ),
//           MaterialButton(
//             onPressed: () {
//               controller.upload();
//               // controller.pickImageFromCamera();
//             },
//             child: Text("upload image"),
//           ),
