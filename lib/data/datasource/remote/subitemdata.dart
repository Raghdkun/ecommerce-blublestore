import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class SubItemsData {
  Crud crud ; 

  SubItemsData(this.crud) ;

  getData(String id) async {
    var response = await crud.postData(AppLink.subitemscolor , {
      "id" : id
    }); 
   return response.fold((l) => l, (r) => r) ;
  }
  getData1(String id) async {
    var response = await crud.postData(AppLink.subitemssizes , {
      "id" : id
    }); 
   return response.fold((l) => l, (r) => r) ;
  }
  
} 