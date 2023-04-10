import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Vaild Username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Vaild Email";
    }
  }
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == "Phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Vaild Phone Number";
    }
  }
  if (val.length < min) {
    return "can't be less then $min";
  }
  if (val.length > max) {
    return "can't be larger then $max";
  }
}
