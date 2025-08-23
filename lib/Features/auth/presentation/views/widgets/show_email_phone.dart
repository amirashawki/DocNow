
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ShowEmailOrPhone extends StatefulWidget {
  const ShowEmailOrPhone({super.key});

  @override
  State<ShowEmailOrPhone> createState() => _ShowEmailOrPhoneState();
}

bool showEmail = false;

class _ShowEmailOrPhoneState extends State<ShowEmailOrPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        color: Color(0xffDCDCDC),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showEmail = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: showEmail ? AppColor.kprimaryColor : Color(0xffDCDCDC),
                  borderRadius: BorderRadius.circular(42),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7.5,
                    ),
                    child: Text(
                      'Email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: showEmail ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showEmail = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: showEmail ? Color(0xffDCDCDC) : AppColor.kprimaryColor,
                  borderRadius: BorderRadius.circular(42),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7.5,
                    ),
                    child: Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 14,
                        color: showEmail ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
