import 'package:docnow_app/Features/auth/presentation/views/SignUp_view.dart';
import 'package:docnow_app/Features/auth/presentation/views/login_view.dart';
import 'package:docnow_app/Features/payment/presentation/views/payment_%20successful.dart';
import 'package:docnow_app/Features/payment/presentation/views/payment_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kSingUpView = '/signup';
  static final kLoginView = '/LoginView';
  static final kPaymentView = '/PaymentView';
  static final kPaymentSuccessful = '/PaymentSuccessful';
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) {
      //     return LoginView();
      //   },
      // ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) {
      //     return PaymentView();
      //   },
      // ),
      GoRoute(
        path: kSingUpView,
        builder: (context, state) {
          return SignUpView();
        },
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return PaymentSuccessful();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return LoginView();
        },
      ),
    ],
  );
}
