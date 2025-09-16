
import 'package:docnow_app/Features/payment/presentation/views/widgets/pay_button.dart';
import 'package:docnow_app/Features/payment/presentation/views/widgets/payment_Info_row.dart';
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:docnow_app/core/utils/app_styles.dart';
import 'package:docnow_app/core/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}




class _PaymentViewState extends State<PaymentView> {
  String? selectedMethod = 'Stripe';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text('Payment Info', style: AppStyles.medium16(context)),
            SizedBox(height: 16),
            PaymentInfoRow(title: 'Total price', price: r'$24'),
            SizedBox(height: 16),
            PaymentInfoRow(title: 'Tax', price: r'$0'),
            SizedBox(height: 16),
            PaymentInfoRow(title: 'Insurances', price: r'$12'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price', style: AppStyles.medium16(context)),
                Text(
                  r'$12',
                  style: AppStyles.medium16(context).copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' Payment Options', style: AppStyles.medium16(context)),
                Text(
                  ' + Add new',
                  style: AppStyles.medium14(
                    context,
                  ).copyWith(color: Color(0xff0531F6)),
                ),
              ],
            ),
            SizedBox(height: 16),
            buildPaymentOption(title: 'Stripe', imagePath: Assets.imagesStripe, isSelected: selectedMethod == 'Stripe'),
            SizedBox(height: 16),
            buildPaymentOption(title: 'PayPal', imagePath: Assets.imagesPayPal, isSelected: selectedMethod == 'PayPal'),
            SizedBox(height: 26),
            PayButton(isPaypal: selectedMethod == 'PayPal'),
          ],
        ),
      ),
    );
  }












  buildPaymentOption({required String title, required String imagePath, required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDCDCDC)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 40),
        title: Text(title),
        trailing: Radio<String>(
          value: title,
          groupValue: selectedMethod,
          activeColor: AppColor.kprimaryColor,
          onChanged: (value) {
            setState(() {
              selectedMethod = value;
              isSelected = value == title;
            });
          },
        ),
        onTap: () {
          setState(() {
            selectedMethod = title;
            isSelected = true;
          });
        },
      ),
    );
  }
}


// class BuildPaymentOption extends StatefulWidget {
//   const BuildPaymentOption({
//     super.key,
//     required this.title,
//     required this.imagePath,
//   });
//   final String title, imagePath;
//   @override
//   State<BuildPaymentOption> createState() => _BuildPaymentOptionState();
// }

// class _BuildPaymentOptionState extends State<BuildPaymentOption> {
//   @override
//   String? selectedMethod = 'Stripe';
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Color(0xffDCDCDC)),
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: ListTile(
//         leading: Image.asset(widget.imagePath, width: 40),
//         title: Text(widget.title),
//         trailing: Radio<String>(
//           value: widget.title,
//           groupValue: selectedMethod,
//           activeColor: AppColor.kprimaryColor,
//           onChanged: (value) {
//             setState(() {
//               selectedMethod = value;
//             });
//           },
//         ),
//         onTap: () {
//           setState(() {
//             selectedMethod = widget.title;
//           });
//         },
//       ),
//     );
//   }
// }
