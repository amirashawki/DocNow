import 'package:docnow_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });
  final String text1, text2, text3, text4;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                color: AppColor.kprimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: text3,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: text4,
              style: TextStyle(
                color: AppColor.kprimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
