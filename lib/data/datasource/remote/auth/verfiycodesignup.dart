import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;

  VerfiyCodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verfiyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
  resendData(String email, ) async {
    var response = await crud.postData(AppLink.resend, {
      "email": email,
      
    });
    return response.fold((l) => l, (r) => r);
  }
}
