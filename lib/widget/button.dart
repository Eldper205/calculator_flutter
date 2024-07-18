import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final Color boxColor;
  final Color textColor;
  final String text;
  final VoidCallback buttonTapped;  // 无效回调

  // Default Constructor
  const CustomButton({Key? key,
    required this.boxColor,
    required this.textColor,
    required this.text,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* GestureDetector: a widget that detects gestures.
       -> attempts to recognize gestures that correspond
          to its non-null callbacks. 尝试识别与其非空回调相对应的手势
     */
    return GestureDetector ( // 手势检测器
      onTap: buttonTapped,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 19),
          ),
        ),
      ),
    );
  }
}
