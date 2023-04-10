import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class ItemsData {
  Crud crud ; 

  ItemsData(this.crud) ;

  getData(String id , String usersid) async {
    var response = await crud.postData(AppLink.items , {"id" : id.toString() , "usersid" : usersid.toString() }); 
   return response.fold((l) => l, (r) => r) ;
  }
}