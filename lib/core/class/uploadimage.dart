import 'package:dartz/dartz.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class UploadImage {
  Future<Either<StatusRequest, Map>> postData(String linkurl, dynamic data) async {
   
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
          // print(response.statusCode) ; 

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Map responsebody = jsonDecode(response.body);
          
          // print(responsebody) ; 
          return Right(data);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
     
  }
}