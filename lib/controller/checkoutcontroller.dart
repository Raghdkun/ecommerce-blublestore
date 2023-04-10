import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/constant/color.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/addressdata.dart';
import 'package:powerecommerce/data/datasource/remote/ordersdata.dart';

import 'package:powerecommerce/data/datasource/remote/transaction/transactiondata.dart';

import 'package:http/http.dart' as http;
import 'package:powerecommerce/data/datasource/remote/transaction/uploadimage.dart';
import 'package:powerecommerce/data/model/addressmodel.dart';
import 'package:powerecommerce/data/model/cartmodel.dart';
import 'package:powerecommerce/data/model/transactionsmodel.dart';
import 'package:powerecommerce/linkapi.dart';

class CheckoutController extends GetxController {
  File? file;
  final ImagePicker picker = ImagePicker();
  final String imageNewName = "haram" +
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString() +
      ".jpg";
  late StatusRequest statusRequest;
  TransactionData transactionData = TransactionData(Get.find());
  List<TransactionModel> data = [];
  TransactionModel? transactionModel;
  MyServices myServices = Get.find();
  TextEditingController? totalController;
  TextEditingController? nameController;
  late String couponid;
  late String priceorder;
  late String disscountCoupon;
  late String color;
  late String size;
  String totalallprice = "";

  AddressData addressData = AddressData(Get.find());
  OrdersData ordersData = OrdersData(Get.find());
  UploadImageData uploadImageData = UploadImageData(Get.find());

  List<AddressModel> address = [];

  String? addressId;
   CartModel? cartModel ;

  chooseAddress(String val) {
    addressId = val;
    print("haha");
    update();
  }

  getAddressData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("==================== address $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        address.addAll(listData.map((e) => AddressModel.fromJson(e)));
        // totalallprice = myServices.sharedPreferences.getString("totalprice").toString() ;
        addressId = address[0].addressId.toString();
        print(totalallprice);
      } else {
        Container(
          child: MaterialButton(
            onPressed: () {
              Get.offNamed(AppRoute.addressadd);
            },
            child: Text("Add Address"),
          ),
        );
      }
    }
    update();
  }

  upload() async {
    if (file == null) ;
    statusRequest = StatusRequest.loading;
    String base64 = base64Encode(file!.readAsBytesSync());
    String imageName = file!.path.split("/").last;
    imageName = imageNewName;
    var data = {"imagename": imageName, "base64": base64};
    print(data);
    // var response = uploadImageData.getData(base64, imageName);
    var response = await http.post(Uri.parse(AppLink.uploadimage), body: data);
    statusRequest = handlingData(response);
  }

  checkData() {
    if (file == null) {
      Get.defaultDialog(
        title: "Alert",
        middleText: "You Should Upload Transaction Image First",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
    } else if (addressId == null) {
      Get.defaultDialog(
        title: "Alert",
        middleText: "You Should select the address Too",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
    } else if (addressId == null && file == null) {
      Get.defaultDialog(
        title: "Alert",
        middleText: "You Should select the address First",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  insertData() async {
    if (file == null)
      Get.defaultDialog(
        title: "Alert",
        middleText: "You Should Upload Transaction Image First",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
    if (addressId == null)
      Get.defaultDialog(
        title: "Alert",
        middleText: "You Should select the address First",
        buttonColor: AppColor.customBlack,
        onConfirm: () {
          Get.back();
        },
      );
    statusRequest = StatusRequest.loading;
    var response = await ordersData.addData(
      myServices.sharedPreferences.getString("id")!,
      addressId!,
      imageNewName,
      couponid,
      priceorder,
      disscountCoupon,
      myServices.sharedPreferences.getString("color")!,
      myServices.sharedPreferences.getString("size")!,
    );
    print("=============== $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        upload();
        Get.defaultDialog(
          // title: "Warning",
          middleText:
              "The request was successful and the request is being processed",
          buttonColor: AppColor.customBlack,
          onConfirm: () {
            Get.offAllNamed(AppRoute.home);
          },
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future pickImageFromGallory() async {
    final pickFromGallory = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    // final pickFromCamera =
    //     await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickFromGallory != null) {
      // file = File(pickFromCamera!.path) ;
      file = File(pickFromGallory.path);
      update();
    } else {}
  }

  Future pickImageFromCamera() async {
    // final pickFromGallory =
    //     await ImagePicker().pickImage(source: ImageSource.gallery);
    final pickFromCamera = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickFromCamera != null) {
      // file = File(pickFromCamera!.path) ;
      file = File(pickFromCamera.path);
      update();
    } else {}
  }
  // initialData(){
  //  Get.arguments("total") ;
  // }

  @override
  void onInit() {
    totalController = TextEditingController();
    nameController = TextEditingController();
    //  initialData();
    couponid = Get.arguments['couponId'];
    priceorder = Get.arguments['priceorder'].toString();
    disscountCoupon = Get.arguments['disscountCoupon'];
    totalallprice = Get.arguments['totalallprice'];
    cartModel = Get.arguments['cartmodel'];


    // color = Get.arguments['color'];
    // size = Get.arguments['size'];

    getAddressData();
    refresh();
    super.onInit();
  }
}
