import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  pendingData(String usersid) async {
    var response = await crud.postData(AppLink.pendingorders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  archiveData(String usersid) async {
    var response = await crud.postData(AppLink.archive, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(
      String usersid,
      String addressid,
      String image,
      String couponid,
      String orderprice,
      String disscountCoupon,
      String color,
      String size) async {
    var response = await crud.postData(AppLink.addorder, {
      "usersid": usersid,
      "address": addressid,
      "image": image,
      "couponid": couponid,
      "price": orderprice,
      "disscountCoupon": disscountCoupon,
      "color": color,
      "size": size,
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.delete, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
