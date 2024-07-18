import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {

  /*
     userInput: what user entered with the keyboard on 'inPutSection'.
     userOutput: calculate the numbers that the user entered and put into 'userOutput' variable.
  */
  // Declare initial default value (blank) for userInput and userOutput (display on 'outPutSection')
  var userInput = '';
  var userOutput = '';

  /// Equal Button Pressed Func
  equalBtnPressed() {
    String userInputFC = userInput;
    // replaceAll(Pattern from, String replace);
    userInputFC = userInputFC.replaceAll('x', '*');
    userInputFC = userInputFC.replaceAll('÷', '/');

    // Term under 'Math_Expressions' package.
    Parser p = Parser();  // 解析器
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);
    // eval = expression result

    /// Convert userOutput value into type 'String'
    userOutput = eval.toString();
    update();
  }

  /// Clear Button Pressed Func
  clearInputOutput() {
    userInput = '';
    userOutput = '';
    update();
  }

  /// Delete Button Pressed Func
  deleteBtnAction() {
    // Delete previous 'userInput' value.
    // substring(int start, int?end): extracts characters from start to end (exclusive).
    userInput = userInput.substring(0, userInput.length - 1);
    update();
  }

  /// On Number Button Tapped Func
  onBtnTapped(List<String> buttonsList, int index) {
    userInput = userInput + buttonsList[index];
    update();
  }


}