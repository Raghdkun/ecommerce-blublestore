import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class OrdersArchiveRatingData {
  Crud crud ; 

  OrdersArchiveRatingData(this.crud) ;

  getData(String id , String rating, String comment) async {
    var response = await crud.postData(AppLink.orderarchiverating , {
      "id" : id, 
      "rating" : rating,
      "comment" : comment, 
    }); 
   return response.fold((l) => l, (r) => r) ;
  }
}