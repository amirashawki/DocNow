import 'dart:developer';

import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:docnow_app/Features/payment/presentation/manager/cubit/stripe_cubit.dart';
import 'package:docnow_app/core/utils/app_router.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
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
        PaymentIntentInputModel paymentIntentInputModel =
            PaymentIntentInputModel(
              amount: '1200',
              currency: 'USD',
              customerId: 'cus_T1Fp4oll006L8l',
            );
        return CustomButton(
          title: 'Pay Now',
          onTap: () {
            BlocProvider.of<StripeCubit>(
              context,
            ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}
