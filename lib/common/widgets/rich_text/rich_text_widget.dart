import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/helper/selection_mode/is_dark_mode.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String titleOnPress;
  final Widget onPage;

  const RichTextWidget({
    super.key,
    required this.title,
    required this.titleOnPress,
    required this.onPage,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
                color: context.isDarkMode ? Colors.white : Colors.black),
          ),
          TextSpan(
            text: titleOnPress,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => onPage),
                );
              },
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
