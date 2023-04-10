import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class TransactionData {
  Crud crud;

  TransactionData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.viewtransaction, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String total, String name , String image) async {
    var response = await crud.postData(AppLink.addtransaction, {
      "usersid": usersid,
      "fullname" : name ,
      "total": total,
      "image": image,
    });
    return response.fold((l) => l, (r) => r);
  }
}
