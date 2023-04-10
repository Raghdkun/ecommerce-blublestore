import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class ContactUsData {
  Crud crud ; 

  ContactUsData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.contactusview , {}); 
   return response.fold((l) => l, (r) => r) ;
  }
}