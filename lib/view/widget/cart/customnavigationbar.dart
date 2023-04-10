import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/cart_controller.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/view/widget/cart/curombuttoncoupon.dart';
import 'package:powerecommerce/view/widget/cart/custombuttoncart.dart';

class CustomNavigationBar extends GetView<CartController> {
  final String price;
  final String totalPrice;
  final String disscount;
  final TextEditingController controllerCoupon;
  final void Function()? onApplyCoupon;
  final void Function()? ontap;

  const CustomNavigationBar(
      {super.key,
      required this.price,
      required this.ontap, 
      required this.totalPrice,
      required this.controllerCoupon,
      this.onApplyCoupon,
      required this.disscount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: Get.height / 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text("$disscount"),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.customBlack),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.customBlack),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text("$price S.P",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.customBlack),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Total Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.customBlack),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text("$totalPrice S.P",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Divider(),
          CustomButtonCart(
            textbutton: "Check Out",
            onPressed: ontap,
          ),
        ],
      ),
    );
  }
}
