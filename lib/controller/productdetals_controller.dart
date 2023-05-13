import 'package:get/get.dart';
import 'package:powerecommerce/controller/cart_controller.dart';

import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/subitemdata.dart';
import 'package:powerecommerce/data/model/itemscolormode.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';
import 'package:powerecommerce/data/model/itemssizesmodel.dart';
import 'package:powerecommerce/linkapi.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share/share.dart';

import '../data/datasource/remote/cart_data.dart';

abstract class ProductDetailsControlller extends GetxController {
  goToPageImages(ItemsModel itemsModel);
}

class ProductDetailsControlllerImp extends ProductDetailsControlller {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  SizesItemsModel? sizesItemsModel;

  SubItemsData subItemsData = SubItemsData(Get.find());

  // String color1 = '';
  List<ColorsItemsModel> colorsitems = [];
  List<SizesItemsModel> sizesitems = [];

  bool activeColor = false;
  bool activesize = false;
  String? colorName;
  String? sizesName;
  late var quantity;

  CartController cartController = Get.put(CartController());

  var countitems;

  images(String itemsimage) {
    List img = [
      "${AppRoute.images}/${itemsimage}",
      "${AppRoute.images}/${itemsimage}",
      "${AppRoute.images}/${itemsimage}",
    ];
    return img;
  }

// List img = ["${AppRoute.images}/${itemsimage}"] ;
  // List subitems = [
  //   {"name": "{itemsModel.itemsColor1}", "id": "1", "active": 0},
  //   {"name": "green", "id": "2", "active": 0},
  //   {"name": "blue", "id": "3", "active": 1}
  // ];
  chooseColor(String val) {
    colorName = val;
    print("haha");
    update();
  }

  chooseSizes(String val) {
    sizesName = val;
    print("haha");
    update();
  }

  getColorsData() async {
    statusRequest = StatusRequest.loading;
    colorsitems.clear();
    update();
    var response = await subItemsData.getData(itemsModel.itemsId.toString());
    print("==================== subitems $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        colorsitems.addAll(listData.map((e) => ColorsItemsModel.fromJson(e)));
        // colorName = colorsitems[0].itemscolorsName.toString();
        // myServices.sharedPreferences.setString("color", colorName!);
        // myServices.sharedPreferences.setString("size", sizesName!);

        // totalallprice = myServices.sharedPreferences.getString("totalprice").toString() ;
      } else {}
    }
    update();
  }

  getsizesData() async {
    statusRequest = StatusRequest.loading;
    sizesitems.clear();
    update();
    var response = await subItemsData.getData1(itemsModel.itemsId.toString());
    print("==================== subitems $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        sizesitems.addAll(listData.map((e) => SizesItemsModel.fromJson(e)));
        // sizesName = sizesitems[0].itemssizesTitle.toString();
        // totalallprice = myServices.sharedPreferences.getString("totalprice").toString() ;
      } else {}
    }
    update();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    myServices.sharedPreferences.getString("itemspricedisscount");
    // myServices.sharedPreferences.getString("color");
    // myServices.sharedPreferences.getString("size");

    getColorsData();
    getsizesData();

    // color1 = itemsModel.itemsColor1.toString();
    update();
  }

  @override
  goToPageImages(ItemsModel itemsModel) {
    Get.toNamed("images", arguments: {"itemsmodel": itemsModel});
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response['data'].toString());
        print("==================================");
        print("$countitems");
        return countitems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  add() {
    cartController.addItems(
        itemsModel.itemsId!.toString(), colorName!, sizesName!);
    countitems++;
    Get.toNamed(
      'cart',
    );
    update();
  }

  int getProductId() {
    final productId = Get.parameters['itemsid'];
    return int.parse(productId.toString());
  }

  remove() {
    if (countitems > 0) {
      cartController.deleteItems(itemsModel.itemsId!.toString());
      countitems--;
      update();
    }
  }

  dynamiclinkfirebase(itemsid) async {
    final dynamicLinkParm = DynamicLinkParameters(
        link: Uri.parse("https://blublestore.com/productdetails/$itemsid"),
        uriPrefix: "https://blublestore.page.link/DQbR",
        androidParameters: AndroidParameters(
          packageName: "com.powerecommerce.ecommerce",
          fallbackUrl: Uri.parse("https://blublestore.com/") , 

        ));
        Uri link = await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParm); 
        print(link) ; 
        PendingDynamicLinkData(link: link);
         
        Share.share(link.toString()); 
  }

  @override
  void onInit() {
    intialData();

    super.onInit();
  }
}
