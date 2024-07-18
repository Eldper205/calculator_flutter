import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculator/controller/theme_controller.dart';
import 'package:calculator/utils/color.dart';
import 'package:calculator/widget/button.dart';
import 'package:calculator/controller/calculate_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> buttonsList = [
    'CLE', 'DEL', '%', '÷', '7', '8', '9', 'x', '4', '5',
    '6', '-', '1', '2', '3', '+', '0', '.', 'ANS', '=',
  ];

  @override
  Widget build(BuildContext context) {

    // For theme color changed purposes
    var controller = Get.find<CalculateController>();
    var themeController = Get.find<ThemeController>();  // from theme_controller.dart

    // GetBuilder - simple state manager: use (GetxController)
    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        // data from theme_controller.dart
        // Ternary operator
        backgroundColor: themeController.isDarktheme
            ? DarkColor.scaffoldBgColor
            : LightColor.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            inPutSection(themeController, controller),
          ],
        ),
      );
    });
  }


  /// inPutSection 输入部分: Enter numbers
  Expanded inPutSection(ThemeController themeController, CalculateController controller) {
    // Expanded Class: A widget that expands a child of a Row, Column,
    // or Flex so that the child fills the available space.
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          // Background color for the layer behind the keyboard number. (sheet)
          color: themeController.isDarktheme
              ? DarkColor.sheetBgColor
              : LightColor.sheetBgColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)
          ),
        ),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: buttonsList.length,
            // Calculate the number of buttons available
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              switch (index) {

              /// CLEAR Button
                case 0: // index 0 in -> List<String> buttonsList
                  return CustomButton(
                    buttonTapped: () {
                      controller.clearInputOutput();
                    },
                    boxColor: themeController.isDarktheme
                        ? DarkColor.btnBgColor
                        : LightColor.btnBgColor,
                    textColor: themeController.isDarktheme ? DarkColor
                        .leftOperatorColor : LightColor.leftOperatorColor,
                    text: buttonsList[index],
                  );

              /// DELETE Button
                case 1: // index 1 in -> List<String> buttonsList
                  return CustomButton(
                    buttonTapped: () {
                      controller.deleteBtnAction();
                    },
                    boxColor: themeController.isDarktheme
                        ? DarkColor.btnBgColor
                        : LightColor.btnBgColor,
                    textColor: themeController.isDarktheme ? DarkColor
                        .leftOperatorColor : LightColor.leftOperatorColor,
                    text: buttonsList[index],
                  );

              /// EQUAL Button
                case 19: // index 0 in -> List<String> buttonsList
                  return CustomButton(
                    buttonTapped: () {
                      controller.equalBtnPressed();
                    },
                    boxColor: themeController.isDarktheme
                        ? DarkColor.btnBgColor
                        : LightColor.btnBgColor,
                    textColor: themeController.isDarktheme ? DarkColor
                        .leftOperatorColor : LightColor.leftOperatorColor,
                    text: buttonsList[index],
                  );

              /// Index keyboard number from 0 to 18
                default:
                  return CustomButton(
                    buttonTapped: () {
                      controller.onBtnTapped(buttonsList, index);
                    },
                    boxColor: themeController.isDarktheme
                        ? DarkColor.btnBgColor
                        : LightColor.btnBgColor,
                    // The symbol keyboard for (isOperator) are declared in a method
                    textColor: isOperator(buttonsList[index])
                        ? LightColor.operatorColor
                        : themeController.isDarktheme
                        ? Colors.white
                        : Colors.black,
                    text: buttonsList[index],
                  );
              } // end of switch
            } // end of itemBuilder
        ),
      ),
    );
  }

  /// outPutSection 输出部分 - Show Result
  Expanded outPutSection(ThemeController themeController, CalculateController controller) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container: Color theme icons setup (background setup)
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                color: themeController.isDarktheme
                    ? DarkColor.sheetBgColor
                    : LightColor.sheetBgColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              // Center: theme icons setup
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        themeController.lightTheme();
                      },
                      // Black Mode Icon
                      child: Icon(
                        // Setup icon color and type while in black theme mode.
                        Icons.light_mode_outlined,
                        color: themeController.isDarktheme ? Colors.grey : Colors.black,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        themeController.darkTheme();
                      },
                      // Light Mode Icon
                      child: Icon(
                        // Setup icon color and type while in light theme mode.
                        Icons.dark_mode_outlined,
                        color: themeController.isDarktheme ? Colors.white : Colors.grey,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top : 70),
            child: Column(
              children: [
                // Container: for userInput
                Container(
                  alignment: Alignment.centerRight,
                  // Numbers for the user entered with by tapping on keyboard number.
                  child: Text(
                    controller.userInput,
                    style: TextStyle(
                      // Number color to white if the current theme is Dark.
                      color: themeController.isDarktheme ? Colors.white : Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                // Container: for userOutput
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.userOutput,
                    style: TextStyle(
                      color: themeController.isDarktheme ? Colors.white : Colors.black,
                      fontSize:  43.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// isOperator: different color for Operator symbol keyboard
  bool isOperator(String y) {
    if (y == "%" || y == "÷" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }

}

