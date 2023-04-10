
import 'package:powerecommerce/core/class/uploadimage.dart';
import 'package:powerecommerce/linkapi.dart';

class ImageUploadData {
  UploadImage uploadImage ; 

  ImageUploadData(this.uploadImage) ;

  getData(String imageName , String base64) async {
    var response = await uploadImage.postData(AppLink.uploadimage , {"imagename": imageName, "base64": base64}); 
   return response.fold((l) => l, (r) => r) ;
  }
}