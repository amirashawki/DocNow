import 'package:device_preview/device_preview.dart';
import 'package:docnow_app/core/utils/api_keys.dart';
import 'package:docnow_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
    DevicePreview(
      builder: (BuildContext context) {
        return const MyApp();
      },
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
