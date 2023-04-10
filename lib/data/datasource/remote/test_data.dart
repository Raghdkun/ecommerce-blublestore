import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class TestData {
  Crud crud ; 

  TestData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.test , {}); 
   return response.fold((l) => l, (r) => r) ;
  }
}