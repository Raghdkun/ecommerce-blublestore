import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:powerecommerce/data/model/ordersmodel.dart';
import 'package:powerecommerce/linkapi.dart';

class OedersImageController extends GetxController {
  late OrdersModel ordersModel;

  Future<void> saveImage(BuildContext context) async {
    String? message;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    String url = "${AppLink.imageserver}/${ordersModel.ordersImage}";

    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/${ordersModel.ordersImage}';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      // final params = SaveFileDialogParams(sourceFilePath: file.path);
      // final finalPath = await FlutterFileDialog.saveFile(params: params);

      message = 'Image saved!';
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    // if (message != null) {
    //   scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    // }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    super.onInit();
  }
}
