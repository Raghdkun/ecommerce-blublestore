import 'package:get/get.dart';
import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/core/class/uploadimage.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
    Get.put(UploadImage()) ;

  }

}