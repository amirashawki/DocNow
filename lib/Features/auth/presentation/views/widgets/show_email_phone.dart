import 'package:docnow_app/Features/auth/presentation/views/widgets/Custom_email_phone_Button.dart';
import 'package:docnow_app/core/utils/app_color.dart';

import 'package:flutter/material.dart';

class ShowEmailOrPhone extends StatefulWidget {
  const ShowEmailOrPhone({
    super.key,
    required this.columnEmail,
    required this.columnPhone,
  });
  final Column columnEmail, columnPhone;
  @override
  State<ShowEmailOrPhone> createState() => _ShowEmailOrPhoneState();
}

bool showEmail = false;

class _ShowEmailOrPhoneState extends State<ShowEmailOrPhone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            color: Color(0xffDCDCDC),
          ),
          child: Row(
            children: [
              CustomEmailOrPhoneButton(
                onTap: () {
                  setState(() {
                    showEmail = true;
                  });
                },
                text: 'Email',
                containerColor: showEmail
                    ? AppColor.kprimaryColor
                    : Color(0xffDCDCDC),
                textColor: showEmail ? Colors.white : Colors.black,
              ),

              CustomEmailOrPhoneButton(
                text: 'Phone',
                onTap: () {
                  setState(() {
                    showEmail = false;
                  });
                },
                containerColor: showEmail
                    ? Color(0xffDCDCDC)
                    : AppColor.kprimaryColor,
                textColor: showEmail ? Colors.black : Colors.white,
              ),
            ],
          ),
        ),
        showEmail ? widget.columnEmail : widget.columnPhone,
      ],
    );
  }
}
