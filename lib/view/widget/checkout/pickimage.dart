import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/controller/checkoutcontroller.dart';
import 'package:get/get.dart';

class PickImage extends GetView<CheckoutController> {
  final String text1;
  final String text2;

  const PickImage(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            width: 100,
            height: 55,
            decoration: BoxDecoration(color: AppColor.customBlack),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () {
                        controller.pickImageFromGallory();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.library_add,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              text1,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        controller.pickImageFromCamera();
                      },
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          controller.file != null
              ? Row(
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
                    Text(text2),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

// controller.file != null
                //     ? Image.file(
                //         controller.file!,
                //         width: 400,
                //         height: 400,
                //       )
                //     : Container()