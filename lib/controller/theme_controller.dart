import 'package:get/get.dart';

class ThemeController extends GetxController {

  // Declare initial default value for ColorTheme
  bool isDarktheme = true;

  lightTheme() {
    isDarktheme = false;
    update();
  }

  darkTheme() {
    isDarktheme = true;
    update();
  }
}