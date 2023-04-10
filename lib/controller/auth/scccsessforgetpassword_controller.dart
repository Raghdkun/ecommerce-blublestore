import 'package:get/get.dart';
import 'package:powerecommerce/core/constant/routes.dart';

abstract class SuccessResetPassword extends GetxController {
  login();
  goToLogIn();
  
}

class SuccessResetPasswordImp extends SuccessResetPassword {
  
  
  @override
  login() {
    
  }

  @override
  goToLogIn() {
    Get.offAllNamed(AppRoute.login);
  }

 
  }
  
  
