import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/checkoutcontroller.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';

class AddressCheckOut extends GetView<CheckoutController> {
  final bool isActive;
  final String nameEn;
  final String nameAR;
  final String cityEn;
  final String cityAr;
  final String ShippingEn;
  final String ShippingAr;

  const AddressCheckOut(
      {super.key,
      required this.isActive,
      required this.nameEn,
      required this.nameAR,
      required this.cityEn,
      required this.cityAr,
      required this.ShippingEn,
      required this.ShippingAr});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            // color: isActive == true ? Colors.black : null,
            child: Column(
          children: [
            translateDataBase(
              ListTile(
                title: Text("اسمك : $nameAR "),
              ),
              ListTile(
                title: Text("Your Name : $nameEn "),
              ),
            ),
            ListTile(
              trailing: isActive == true
                  ? Icon(FontAwesomeIcons.check,
                      size: 35, color: Colors.green.shade700)
                  : null,
              title: translateDataBase(
                  Text("مدينتك : $cityAr "), Text("Your city : $cityEn ")),
            ),
            ListTile(
                title: translateDataBase(
              Text("عنوان الشحن : $ShippingAr "),
              Text("Your Shipping : $ShippingEn "),
            )),
          ],
        )),
        SizedBox(height: 10,)
      ],
    );
  }
}
