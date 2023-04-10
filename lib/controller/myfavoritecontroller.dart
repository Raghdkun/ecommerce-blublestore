import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';
// import 'package:powerecommerce/data/model/itemsmodel.dart';
import 'package:powerecommerce/data/model/myfavoritemodel.dart';
import 'package:powerecommerce/view/screen/items.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List<MyFavoriteModel> data = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    print("error $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data");
        print(data);
        // data.addAll(response['data']);
      } else {
        
      }
      update();
    }
  }

  deleteFromFavorite(String favoriteid) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = favoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    update();
  }

  // goToPageProductDetails(ItemsModel itemsModel) {
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  // }
  // goToPageProductDetails(MyFavoriteModel itemsModel) {
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  // }

  @override
  void onInit() {
    getData();
    update();
    super.onInit();
  }
}
