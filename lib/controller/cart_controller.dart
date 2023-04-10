import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/cart_data.dart';
import 'package:powerecommerce/data/model/cartmodel.dart';
import 'package:powerecommerce/data/model/couponmodel.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  TextEditingController? controllerCoupon;
  CartModel? cartModel;

  List<CartModel> data = [];

  CouponModel? couponModel;

  int? disscountCoupon = 0;
  String? couponname;
  String? couponid;
  late String scolor;
  late String ssize;

  double priceOrders = 0.0;
  int totalcountitems = 0;
  double? totalallprice;

  // intialData(){
  //    Get.arguments({"total":getTotalPrice() });
  // }

  getTotalPrice() {
    return (priceOrders - priceOrders * disscountCoupon! / 100);
  }

  goToPageCheckout() {
    totalallprice = priceOrders - priceOrders * disscountCoupon! / 100;

    if (data.isEmpty) return Get.snackbar("", "the cart is Empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponId": couponid ?? "0",
      "priceorder": priceOrders.toString(),
      "disscountCoupon": disscountCoupon.toString(),
      "totalallprice": totalallprice.toString(),
      

    });
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.couponData(controllerCoupon!.text);
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupon = response["data"];
        couponModel = CouponModel.fromJson(dataCoupon);
        disscountCoupon = int.parse(couponModel!.couponDiscount.toString());
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();

        Get.rawSnackbar(
            title: "Notifcation", messageText: const Text("Coupon Applied!"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;

        Get.defaultDialog(
            title: "alert!",
            middleText: "Coupon Code Is wrong Or Empty!",
            radius: 10,
            buttonColor: AppColor.customBlack,
            actions: [
              MaterialButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok"),
              )
            ]);
        disscountCoupon = 0;
        couponid = null;
        couponname = null;
      }
    }
  }

  addItems(String itemsid, String colors, String sizes) async {
    statusRequest = StatusRequest.loading;
    update();
    // if (myServices.sharedPreferences.getString("color") != null)
    //   scolor = myServices.sharedPreferences.getString("color")!;
    // if (myServices.sharedPreferences.getString("size") != null)
    //   ssize = myServices.sharedPreferences.getString("size")!;

    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
      colors,
      sizes,
    );
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notifcation", messageText: const Text("Cart added"));

        // print("================ $scolor");
        // print("================ $ssize");
        myServices.sharedPreferences.setString("finalcolor", colors);
        myServices.sharedPreferences.setString("finalsize", sizes);

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  deleteItems(
    String itemsid,
  ) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notifcation", messageText: const Text("Cart Removed"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  resetVarCart() {
    totalcountitems = 0;
    priceOrders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(dataresponsecountprice['totalcount'].toString());
          priceOrders =
              double.parse(dataresponsecountprice['totalprice'].toString());

          print(priceOrders);
          myServices.sharedPreferences
              .setString("totalprice", totalallprice!.toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    view();
    //  intialData();
    totalallprice = priceOrders - priceOrders * disscountCoupon! / 100;
    // ssize = Get.arguments['colorname'];
    
    controllerCoupon = TextEditingController();
    super.onInit();
  }
}
