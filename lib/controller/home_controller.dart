import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/fcmconficmessage.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/cart_data.dart';
import 'package:powerecommerce/data/datasource/remote/home_data.dart';
import 'package:powerecommerce/data/datasource/remote/itemsdata.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;
  String? itemspricedisscount;
  TextEditingController? search;
  bool isSearch = false;

  String homeoffertitle = "";
  String homeofferbody = "";

  ItemsData testData = ItemsData(Get.find());

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  List homeoffers = [];

  // List items = [];
  List<ItemsModel> listdata = [];

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onReady() {
    closesearch();

    super.onReady();
  }

  @override
  void onInit() {
    getdata();
    // initDynamicLinks();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   // String? token = value;
    // });
    // FirebaseMessaging.instance.subscribeToTopic("users");
    search = TextEditingController();
// inistialdynamiclink(); 
    initialData();
    super.onInit();
  }

  refreshData() {
    getdata();

    items.clear();
    update();
  }

  closesearch() {
    isSearch = false;
    statusRequest = StatusRequest.none;

    if (search!.text.isNotEmpty) {
      search!.clear();
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearch() {
    if (search!.text.isEmpty) {
      Get.defaultDialog(
          middleText: "You Can Use Searchbar if the Form Is Empty!",
          actions: [
            MaterialButton(
              onPressed: () {
                Get.close(1);
              },
              child: Text("OK"),
            )
          ]);
    } else {
      isSearch = true;
      searchdata();
      update();
    }
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    username = myServices.sharedPreferences.getString("username");
    print("=============================== Controllerhome $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['cat']['data']);
        items.addAll(response['items']['data']);
        homeoffers.addAll(response['homeoffers']['data']);
        homeoffertitle = homeoffers[0]['homeoffers_title'];
        homeofferbody = homeoffers[0]['homeoffers_body'];

        // listdata.addAll(response['data']);
        String userid = myServices.sharedPreferences.getString("id")!;
        FirebaseMessaging.instance.subscribeToTopic("users$userid");
        FirebaseMessaging.instance.subscribeToTopic("users");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responseData = response["data"];
        listdata.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel, itemsid) {
    Get.toNamed("productdetails/$itemsid", arguments: {"itemsmodel": itemsModel});
  }

    

}
    

    
