import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:docnow_app/Features/payment/presentation/manager/cubit/stripe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void exceutePaymentStripe(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '1000',
    currency: 'USD',
    customerId: 'cus_T0oYLeECeHFea1',
  );
  BlocProvider.of<StripeCubit>(
    context,
  ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
