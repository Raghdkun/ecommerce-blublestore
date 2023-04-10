import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:powerecommerce/controller/address/viewaddresscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/addressmodel.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      // persistentFooterButtons: [
      //   MaterialButton(
      //     onPressed: () {},
      //     child: Icon(Icons.home),
      //   ),
      //   MaterialButton(
      //     onPressed: () {},
      //     child: Icon(Icons.home),
      //   ),
      //   MaterialButton(
      //     onPressed: () {},
      //     child: Icon(Icons.home),
      //   ),
      //   MaterialButton(
      //     onPressed: () {
      //       Get.toNamed(AppRoute.home);
      //     },
      //     child: Icon(Icons.home),
      //   ),
      // ],
      persistentFooterAlignment: AlignmentDirectional.center,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("44".tr),
      ),
      body: Column(
        children: [
          CustomButtonAuth(
            text: "43".tr,
            onPressed: () => controller.refreshData(),
          ),
          GetBuilder<ViewAddressController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 15),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardAddress(
                        addressModel: controller.data[index],
                        onDelete: () {
                          if (controller.data[index].addressDelete == 1) {
                            Get.defaultDialog(
                                title: "Error",
                                middleText:
                                    "You Can't Delete Address Because It's Used In You Order",
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("OK"))
                                ]);
                          } else {
                            controller.deleteAddress(
                                controller.data[index].addressId.toString());
                            controller.refreshData();
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: translateDataBase(TextDirection.rtl, TextDirection.ltr),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Card(
              child: Column(
            children: [
              translateDataBase(
                ListTile(
                  title: Text("اسمك : ${addressModel.addressName}"),
                ),
                ListTile(
                  title: Text("Your Name : ${addressModel.addressName}"),
                ),
              ),
              ListTile(
                trailing: IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_forever,
                    size: 35,
                    color: Colors.red.shade700,
                  ),
                ),
                title: translateDataBase(
                    Text("مدينتك : ${addressModel.addressCity}"),
                    Text("Your city : ${addressModel.addressCity}")),
              ),
              ListTile(
                  title: translateDataBase(
                Text("عنوان الشحن : ${addressModel.addressShipping}"),
                Text("Your Shipping : ${addressModel.addressShipping}"),
              )),
            ],
          )),
        ),
      ),
    );
  }
}


// Text("${addressModel.addressName}"),
// Text("${addressModel.addressCity}"),

// Stack(
//           children: [
//             Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         Text("Your Name : "),
//                         Text("${addressModel.addressName}"),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("Your City : "),
//                     Text("${addressModel.addressCity}"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text("Your Shipping : "),
//                     Text("${addressModel.addressShipping}"),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         )