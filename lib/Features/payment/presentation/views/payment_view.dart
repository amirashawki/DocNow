import 'dart:developer';

import 'package:docnow_app/Features/payment/presentation/manager/cubit/stripe_cubit.dart';
import 'package:docnow_app/Features/payment/presentation/views/widgets/payment_Info_row.dart';
import 'package:docnow_app/core/utils/app_color.dart';
import 'package:docnow_app/core/utils/app_images.dart';
import 'package:docnow_app/core/utils/app_router.dart';
import 'package:docnow_app/core/utils/app_styles.dart';
import 'package:docnow_app/core/widgets/custom_appBar.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
  amount: '1200',
  currency: 'USD',
  customerId: 'cus_T1Fp4oll006L8l',
);

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
            buildPaymentOption('Stripe', Assets.imagesStripe),
            SizedBox(height: 16),
            buildPaymentOption('PayPal', Assets.imagesPayPal),
            SizedBox(height: 26),
            BlocConsumer<StripeCubit, StripeState>(
              listener: (context, state) {
                if (state is StripeSuccess) {
                  GoRouter.of(context).push(AppRouter.kPaymentSuccessful);
                } else if (state is StripeFailure) {
                  log(state.errorMessage);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      duration: Duration(seconds: 1000),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  title: 'Pay Now',
                  onTap: () {
                    BlocProvider.of<StripeCubit>(context).makePayment(
                      paymentIntentInputModel: paymentIntentInputModel,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  buildPaymentOption(String title, String imagePath) {
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
            });
          },
        ),
        onTap: () {
          setState(() {
            selectedMethod = title;
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
