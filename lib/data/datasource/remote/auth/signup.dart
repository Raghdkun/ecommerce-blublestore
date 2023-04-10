import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class SignUpData {
  Crud crud ; 

  SignUpData(this.crud) ;

  postData(String username , String password ,String email ,String phone) async {
    var response = await crud.postData(AppLink.signup , {
      "username" : username , 
      "password" : password , 
      "email" : email , 
      "phone" : phone , 


    }); 
   return response.fold((l) => l, (r) => r) ;
  }
}