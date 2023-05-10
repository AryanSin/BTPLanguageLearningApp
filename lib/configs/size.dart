import 'package:get/get.dart';

const double screenWidth = 360;
const double screenHeight = 640;

double getProportionHeight(double height) {
  return Get.height / 640 * height;
}

double getProportionWidth(double width) {
  return Get.width / 360 * width;
}
