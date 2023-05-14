import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:powerecommerce/core/class/statusrequest.dart';
import 'package:powerecommerce/core/functions/handlingdatacontroller.dart';
import 'package:powerecommerce/core/services/services.dart';
import 'package:powerecommerce/data/datasource/remote/itemsdata.dart';
import 'package:powerecommerce/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel, itemid);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
//   createDynamicLink(itemsid) async {
//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//     uriPrefix: 'https://myapp.page.link',
//     link: Uri.parse('https://blublestore.com/productdetails/$itemsid'),
//     androidParameters: AndroidParameters(
//       packageName: 'com.powerecommerce.ecommerce',
//     ),

//   );

//   final Uri dynamicUrl = await parameters.link;
//   return dynamicUrl.toString();
// }



  @override
  goToPageProductDetails(itemsModel, itemsid) {
    Get.toNamed("/productdetails/$itemsid",
        arguments: {"itemsmodel": itemsModel});
    
  }
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      // Extract the link that was passed in the dynamic link
      final Uri deepLink = dynamicLinkData.link;

      // Extract any query parameters from the deep link
      final Map<String, String> queryParams = deepLink.queryParameters;

      // Customize the behavior of the pending dynamic link data object
      final PendingDynamicLinkData data = PendingDynamicLinkData(
        link: deepLink,
        
      );

      // Use the pending dynamic link data object to navigate to the relevant content
      handleDynamicLink(data);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

   handleDynamicLink(PendingDynamicLinkData data) {
  // Navigate to the relevant content based on the pending dynamic link data
  final Uri deepLink = data.link;
  
  final queryParams = deepLink.queryParameters;
  if (queryParams.containsKey('productdetails')) {
    String screenName = queryParams['productdetails']!;
    // Navigate to the relevant screen based on the screen name parameter
    switch (screenName) {
      case 'productdetails':
        Get.toNamed("productdetails/16");
        break;
       
      
    }
  }
}
}
