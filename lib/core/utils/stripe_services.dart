import 'package:dio/dio.dart';
import 'package:docnow_app/Features/payment/data/models/customer_model/customer_model.dart';
import 'package:docnow_app/Features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:docnow_app/Features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:docnow_app/core/utils/api_keys.dart';
import 'package:docnow_app/core/utils/api_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';

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

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Amira',
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
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

    var ephemeralKey = await createEphemeralKey(
      customerId: paymentIntentModel.customer,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      customerId: paymentIntentModel.customer,
      ephemeralKey: ephemeralKey.secret!,
      clientSecret: paymentIntentModel.clientSecret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await ApiServices().post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2025-07-30.basil',
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future<CustomerModel> creatCustomer({required String name}) async {
    var response = await ApiServices().post(
      url: 'https://api.stripe.com/v1/customers',
      body: {'name': name},
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeys.secretKey,
    );
    var customertModel = CustomerModel.fromJson(response.data);
    return customertModel;
  }
}
