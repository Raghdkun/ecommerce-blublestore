import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/view/screen/home.dart';
import 'package:powerecommerce/view/screen/myfavorite.dart';
import 'package:powerecommerce/view/screen/offers/offersview.dart';

import 'package:powerecommerce/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    OffersView(),
    MyFavorite(),
    Settings()
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Payments History", "icon": Icons.shopping_bag_outlined},
    {"title": "Favorite", "icon": Icons.favorite},
    {"title": "Settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
