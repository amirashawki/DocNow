import 'package:flutter/material.dart';

class CustomEmailOrPhoneButton extends StatelessWidget {
  const CustomEmailOrPhoneButton({
    super.key,
    this.onTap,
    required this.containerColor,
    required this.textColor,
    required this.text,
  });
  final void Function()? onTap;
  final Color containerColor, textColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(42),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7.5,
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
