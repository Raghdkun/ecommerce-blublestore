import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class NotificationsData {
  Crud crud;

  NotificationsData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.notification, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
