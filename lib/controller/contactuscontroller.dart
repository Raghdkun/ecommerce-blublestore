import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/contactusdata.dart';
import 'package:powerecommerce/data/model/contactusmodel.dart';

class ContactUsController extends GetxController {
  List<ContactUsModel> data = [];
  late StatusRequest statusRequest;
  ContactUsData contactUsData = ContactUsData(Get.find());

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await contactUsData.getData();
    print("==================== address $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => ContactUsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    update();
    super.onInit();
  }
}
