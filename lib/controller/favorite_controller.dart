import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  Map isfavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());

  MyServices myServices = Get.find() ;

  
  late StatusRequest statusRequest;

  List data = [];


  setFavorite( id, val) {
    isfavorite[id] = val ;
    update() ;
  }


  addFavorite(String itemsid) async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite( myServices.sharedPreferences.getString("id")! , itemsid);
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "Notifcation" , messageText: const Text("Favorate added")) ;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
 

  }

  removeFavorite(String itemsid) async {
    data.clear() ;
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(myServices.sharedPreferences.getString("id")! , itemsid);
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "Notifcation" , messageText: const Text("Favorate Removed")) ;

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  

  }
}
