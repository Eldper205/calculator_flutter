import 'package:calculator/controller/calculate_controller.dart';
import 'package:calculator/controller/theme_controller.dart';
import 'package:get/instance_manager.dart';

/* About Instance Manager Library:
   -> is a modern and intelligent dependency injector that injects and removes dependencies seasonally.
   https://pub.dev/documentation/get/latest/instance_manager/instance_manager-library.html
*/

class MyBindings implements Bindings {
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => CalculateController());
  }
}