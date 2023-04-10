import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(var usersid) async {
    var response =
        await crud.postData(AppLink.viewaddress, {"usersid": usersid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  addData(var usersid, String name, String city, String shipping) async {
    var response = await crud.postData(AppLink.addaddress, {
      "usersid": usersid.toString(),
      "name": name,
      "city": city,
      "shipping": shipping,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(var addressid) async {
    var response =
        await crud.postData(AppLink.deleteaddress, {"addressid": addressid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  editData(var addressid, String name, String city, String shipping) async {
    var response = await crud.postData(AppLink.deleteaddress, {
      "addressid": AddressData,
      "name": name,
      "city": city,
      "shipping": shipping,
    });
    return response.fold((l) => l, (r) => r);
  }
}
