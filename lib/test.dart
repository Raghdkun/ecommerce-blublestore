import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/productdetals_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';

import 'view/widget/productdetails/custompruductdetails.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControlllerImp());
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        body: GetBuilder<ProductDetailsControlllerImp>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text("Product"),
                      actions: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_outlined)),
                      ],
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15)),
                        width: Get.width / 2,
                        
                        child: Directionality(
                          textDirection: translateDataBase(
                              TextDirection.rtl, TextDirection.ltr),
                          child: Column(
                            children: [
                              
                              CustomProductDetails(),
                            ],
                          ),
                        ),
                      ),
                    ))
                  ],
                ));
          },
        ));
  }
}
