import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/address/addaddresscontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/view/widget/address/textformfieldaddress.dart';
import 'package:powerecommerce/view/widget/auth/custombutton.dart';
import 'package:powerecommerce/view/widget/auth/texttitlefield.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(addAddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Add Your Address"),
        ),
        body: GetBuilder<addAddressController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(children: [
                TextTitleField(
                  text: "Enter Your Address Info",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldAddress(
                    hintText: "Name",
                    labeltext: "Enter Your full Name",
                    iconData: Icons.person,
                    myController: controller.name,
                    isNumber: false),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldAddress(
                    hintText: "City",
                    labeltext: "Enter City",
                    iconData: Icons.location_city,
                    myController: controller.city,
                    isNumber: false),
                SizedBox(
                  height: 15,
                ),
                CustomTextFormFieldAddress(
                    hintText: "Shipping",
                    labeltext: "Enter Shipping",
                    iconData: Icons.local_shipping,
                    myController: controller.shipping,
                    isNumber: false),
                SizedBox(
                  height: 15,
                ),
                // GetBuilder<addAddressController>(
                //   builder: (controller) => CustomTextFormFieldAddress(hintText: "Your City", labeltext: "city", iconData: Icons.location_city_sharp, isNumber: false,widget: DropdownButton(
                //       // menuMaxHeight: 150,
                //       borderRadius: BorderRadius.circular(15),
                //       hint: Text(
                //         '${controller.selectedcity}            ',
                //         style: TextStyle(color: Colors.grey.shade600),
                //         // textAlign: TextAlign.start,
                //       ),
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //       underline: Container(
                //         height: 0,
                //       ),
                //       items: controller.Cities.map(
                //         (value) => DropdownMenuItem(
                //           value: value,
                //           child: Text(
                //             "$value",
                //             style: TextStyle(color: AppColor.customBlack),
                //           ),
                //         ),
                //       ).toList(),
                //       onChanged: (String? newVal) {
                //         controller.getcity(newVal!) ;
                //       },
                //     ), )
                // )
                CustomButtonAuth(
                  text: "Save",
                  onPressed: () {
                    controller.addAddress();
                    
                  },
                )
              ]),
            ),
          ),
        ));
  }
}
