import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class OffersData {
  Crud crud ; 

  OffersData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.offersview , {}); 
   return response.fold((l) => l, (r) => r) ;
  }
}