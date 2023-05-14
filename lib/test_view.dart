import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/test_controller.dart';
import 'package:powerecommerce/core/constant/color.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
  TestController controller =  Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text("Test"),
        ),
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(height: 300,   ),
            items: [
              "https://bluplestore.com/ecommerce/upload/items/hisokaearing.jpg",
              "https://bluplestore.com/ecommerce/upload/items/aotnickless.jpg",
              "https://bluplestore.com/ecommerce/upload/items/gumballtshirt.jpg"
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.white),
                      child: Image.network(i, errorBuilder: (context, error, stackTrace) => Image.network("https://bluplestore.com/ecommerce/upload/items/hisokaearing.jpg")));
                },
              );
            }).toList(),
          ),
        ));
  }
}
