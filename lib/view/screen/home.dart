import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/controller/home_controller.dart';
import 'package:powerecommerce/controller/items_controller.dart';
import 'package:powerecommerce/core/class/handlingdataview.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/alertexitapp.dart';
import 'package:powerecommerce/core/functions/translatedatabase.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';

import 'package:powerecommerce/view/widget/home/customproducttitle.dart';
import 'package:powerecommerce/view/widget/home/customad.dart';
import 'package:powerecommerce/view/widget/home/customcategories.dart';
import 'package:powerecommerce/view/widget/home/disscountproducts.dart';
import 'package:powerecommerce/view/widget/customappbar.dart';
import 'package:powerecommerce/view/widget/customsearch.dart';
import 'package:powerecommerce/view/widget/searchwidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    // Get.put(ItemsControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => RefreshIndicator(
          onRefresh: () async {
            await controller.refreshData();
            controller.categories.clear();
          },
          child: Directionality(
            textDirection:
                translateDataBase(TextDirection.rtl, TextDirection.ltr),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.walletview);
                    },
                    icon: Icon(Icons.wallet_outlined)),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.notification);
                    },
                    icon: Icon(Icons.notifications),
                  ),
                ],
                title: Column(
                  children: [
                    Text(
                      "Welcome ${controller.username}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "Bluble Store",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10),

                    child: SafeArea(
                  child: Column(
                    children: [
                      // CustomAppBarTop(
                      //   myText: "Discover",
                      //   onPressed: () {},
                      // ),
                      CustomSearch(
                        myText: "52".tr,
                        mycontroller: controller.search!,
                        onCloseSearch: () {
                          controller.closesearch();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        onSearch: () {
                          controller.onSearch();
                        },
                      ),
                      HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: Expanded(
                          child: ListView(
                            children: [
                              !controller.isSearch == true
                                  ? Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomAd(
                                              title:
                                                  "${controller.homeoffertitle}",
                                              body:
                                                  "${controller.homeofferbody}"),
                                          CustomProductTitle(
                                              productTitle: "50".tr),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomCategories(),
                                          CustomProductTitle(
                                              productTitle: "51".tr),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller.items != null)
                                            DisscountProducts()
                                          else
                                            Container()
                                        ],
                                      ),
                                    )
                                  : SearchedList(
                                      listDataModel: controller.listdata)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ),
          )),
    );
  }
}

class SearchedList extends GetView<HomeControllerImp> {
  final List<ItemsModel> listDataModel;
  const SearchedList({
    super.key,
    required this.listDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index) {
          return GetBuilder<HomeControllerImp>(
              builder: (controller) => InkWell(
                    onTap: () {
                      controller.goToPageProductDetails(listDataModel[index], listDataModel[index].itemsId) ;
                    },
                    child: Container(
                      child: Column(
                        children: [
                          SearchWidget(
                            imagename: "${listDataModel[index].itemsImage}",
                            name: translateDataBase(
                                "${listDataModel[index].itemsNameAr}",
                                "${listDataModel[index].itemsName}"),
                            price: "${listDataModel[index].itemsPrice}",
                          ),
                        ],
                      ),
                    ),
                  ));
        });
  }
}
