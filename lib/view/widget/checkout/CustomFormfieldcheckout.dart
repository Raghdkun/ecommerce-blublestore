import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/checkoutcontroller.dart';
import 'package:powerecommerce/view/widget/address/textformfieldaddress.dart';

class CustomTextFormFieldCheckOut extends GetView<CheckoutController> {
  final String? hint1;
  final String? hint2;
  final String? lebal1;
  final String? label2;

  const CustomTextFormFieldCheckOut(
      this.hint1, this.hint2, this.lebal1, this.label2,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
      children: [
        CustomTextFormFieldAddress(
          hintText: hint1!,
          iconData: Icons.person,
          isNumber: false,
          myController: controller.nameController,
          labeltext: lebal1!,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextFormFieldAddress(
          hintText: hint2!,
          iconData: Icons.payment,
          isNumber: false,
          myController: controller.totalController,
          labeltext: label2!,
        ),
        // SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }
}
