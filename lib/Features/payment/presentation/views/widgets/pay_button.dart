import 'dart:developer';
import 'package:docnow_app/Features/payment/presentation/manager/cubit/stripe_cubit.dart';
import 'package:docnow_app/core/function/exceute_payment_Stripe.dart';
import 'package:docnow_app/core/function/exceute_payment_paypal.dart';
import 'package:docnow_app/core/utils/app_router.dart';
import 'package:docnow_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;

class PayButton extends StatelessWidget {
  const PayButton({super.key,required this.isPaypal});
  final bool isPaypal;

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
        return CustomButton(
          title: 'Pay Now',
          onTap: () {
            isPaypal ? exceutepaymentPaypal(context): 
            exceutePaymentStripe(context);
          },
        );
      },
    );
  }
}
