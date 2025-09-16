import 'dart:developer';
import 'package:docnow_app/core/function/get_transcrationdata.dart';
import 'package:docnow_app/core/utils/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_router.dart';


void exceutepaymentPaypal(BuildContext context) {
  var transcrionsData = getTranscrionsData();

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions: [
          {
            "amount": transcrionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transcrionsData.itemlist.toJson(),
          },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
            GoRouter.of(context).push(AppRouter.kPaymentSuccessful);
        },
        onError: (error) {
          log("onError: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              duration: Duration(seconds: 1000),
            ),
          );
    
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ),
  );
}
