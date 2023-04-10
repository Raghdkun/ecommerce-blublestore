import 'package:powerecommerce/core/class/crud.dart';
import 'package:powerecommerce/linkapi.dart';

class UploadImageData {
  Crud crud;

  UploadImageData(this.crud);

  getData(String base64, String imageName) async {
    var response = await crud
        .postData(AppLink.uploadimage, {"imagename": imageName, "base64": base64});
    return response.fold((l) => l, (r) => r);
  }
}
