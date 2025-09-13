import 'package:docnow_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text('Appointment Details', style: AppStyles.medium16(context)),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, size: 20),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
