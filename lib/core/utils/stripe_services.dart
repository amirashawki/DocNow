import 'package:dio/dio.dart';
import 'package:docnow_app/Features/payment/data/models/Payment_Intent_Input_model.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:docnow_app/core/utils/api_keys.dart';
import 'package:docnow_app/core/utils/api_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  //create payment intent method (amount,currency)
  //initPaymentSheet(merchantDisplayName)
  //presentPaymentSheet()
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await ApiServices().post(
      url: 'https://api.stripe.com/v1/payment_intents',

      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Amira',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
