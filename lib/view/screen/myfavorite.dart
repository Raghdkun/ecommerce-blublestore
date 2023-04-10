import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/homescreencontroller.dart';
import 'package:powerecommerce/controller/myfavoritecontroller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';

import 'package:powerecommerce/view/widget/customappbar.dart';
import 'package:powerecommerce/view/widget/myfavorite/customlistmyfavorite.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
    Get.put(MyFavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        // toolbarHeight: 65,
      ),
      body: Container(
          child: GetBuilder<MyFavoriteController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: RefreshIndicator(
                      onRefresh: () async {
                        await Get.offAllNamed("myFavorite");
                      },
                      child: Container(
                        child: ListView(
                          children: [
                            // const CustomAppBarTop(
                            //   myText: "Favorites",
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.data.length,
                                itemBuilder: (context, index) {
                                  if (controller.statusRequest ==
                                      StatusRequest.failure) {
                                    return Center(
                                      child: Text("Favorites Is Empty"),
                                    );
                                  } else {
                                    return CustomListFavorite.new(
                                        controller.data[index]);
                                  }
                                },
                              ),
                            ),
                            controller.data.isEmpty
                                ? Center(
                                    child: Column(children: [
                                      Text(
                                        "The favorites Is Empty",
                                        textAlign: TextAlign.center,
                                      ),
                                      MaterialButton(
                                        color: AppColor.customBlack,
                                        shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        onPressed: () {
                                          controller.getData();
                                        },
                                        child: Text(
                                          "Refresh page",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ]),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
