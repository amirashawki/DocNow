import 'package:docnow_app/Features/payment/presentation/views/widgets/payment_Info_row.dart';
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:docnow_app/core/utils/app_styles.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset(Assets.imagesSuccess),
            SizedBox(height: 20),
            Text(
              'Payment Successful',
              style: AppStyles.medium16(
                context,
              ).copyWith(fontSize: 24, color: AppColor.kprimaryColor),
            ),
            SizedBox(height: 20),
            Text(r'Successfully paid $24', style: AppStyles.medium16(context)),
            SizedBox(height: 60),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffDCDCDC)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    PaymentInfoRow(title: 'Booking ID:', price: '1111566548'),
                    SizedBox(height: 16),
                    PaymentInfoRow(
                      title: 'Doctor Name:',
                      price: 'Dr. jack Piterson',
                    ),
                    SizedBox(height: 16),
                    PaymentInfoRow(
                      title: 'Transaction',
                      price: '#ED6575219ABN',
                    ),
                    SizedBox(height: 16),
                    PaymentInfoRow(title: 'Date', price: '20 Jun 2025'),
                    SizedBox(height: 16),
                    PaymentInfoRow(title: 'Amount Paid:', price: r'$24'),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text('Status', style: AppStyles.medium14(context)),
                        Spacer(),
                        Image.asset(Assets.imagesApprove),
                        SizedBox(width: 8),
                        Text(
                          'Success',
                          style: AppStyles.medium14(
                            context,
                          ).copyWith(color: Color(0xff4CAF50)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            CustomButton(title: 'Pay Now'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
