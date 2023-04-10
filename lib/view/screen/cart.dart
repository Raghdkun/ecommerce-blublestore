import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/cart_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/color.dart';

import 'package:powerecommerce/view/widget/cart/cartlist.dart';
import 'package:powerecommerce/view/widget/cart/curombuttoncoupon.dart';

import 'package:powerecommerce/view/widget/cart/customnavigationbar.dart';
import 'package:powerecommerce/view/widget/customappbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomNavigationBar(
            ontap: () {controller.goToPageCheckout();},
            controllerCoupon: controller.controllerCoupon!,
            onApplyCoupon: () {},
            price: "${controller.priceOrders}",
            totalPrice: controller.disscountCoupon! > 0
                ? "${controller.getTotalPrice()}"
                : "${controller.priceOrders}",
            disscount: "Your Disscount Is Applied",
          ),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          controller.disscountCoupon == 0
                              ? Text(
                                  "Some Coupons Have Limited Counts So Once You Applied It You Can't Use It Again , Make Sure To Applied It when You Want To Place Order.",
                                  style: TextStyle(fontSize: 12),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        FontAwesomeIcons.solidSquareCheck,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    Text(
                                        "Congrats! Your Have ${controller.disscountCoupon}% Disscount Now!"),
                                  ],
                                ),
                          controller.couponname == null
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          controller:
                                              controller.controllerCoupon,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              hintText: "Enter Coupon Code",
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: CustomButtonCoupon(
                                              onPressed: () {
                                                controller.checkCoupon();
                                                controller.refreshPage();
                                              },
                                              textbutton: "Apply Coupon",
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 10,
                                ),
                          ...List.generate(
                            controller.data.length,
                            (index) => CartList(
                              imagename: "${controller.data[index].itemsImage}",
                              name: "${controller.data[index].itemsName}",
                              price:
                                  "${controller.data[index].itemsprice} ${controller.data[index].itemsDescount}%",
                              count: "${controller.data[index].countitems}",
                              onPressedAdd: () async {
                                await controller.addItems(
                                    controller.data[index].itemsId!.toString(), controller.data[index].cartOrderscolor!,controller.data[index].cartOrderssize!);
                                controller.refreshPage();
                              },
                              onPressedRemove: () async {
                                await controller.deleteItems(
                                    controller.data[index].itemsId!.toString());
                                controller.refreshPage();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
