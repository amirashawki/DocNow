
import 'package:docnow_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PaymentInfoRow extends StatelessWidget {
  const PaymentInfoRow({super.key, required this.title, required this.price});
  final String title, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.medium14(context)),
        Text(price, style: AppStyles.medium16(context).copyWith(fontSize: 14)),
      ],
    );
  }
}