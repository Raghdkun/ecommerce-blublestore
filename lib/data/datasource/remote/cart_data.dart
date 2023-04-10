import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String itemsid, String color , String Size) async {
    var response = await crud.postData(AppLink.cartadd, {
      "usersid": usersid.toString(),
      "itemsid": itemsid.toString(),
      "size" : Size, 
      "color" : color, 
      
    });
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartdelete,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response =
        await crud.postData(AppLink.cartview, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  couponData(String name) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": name});
    return response.fold((l) => l, (r) => r);
  }
}
