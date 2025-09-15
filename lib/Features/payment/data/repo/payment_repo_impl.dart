import 'package:dartz/dartz.dart';
import 'package:docnow_app/Features/payment/data/repo/payment_repo.dart';
import 'package:docnow_app/core/errors/failures.dart';
import 'package:docnow_app/core/utils/stripe_services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';

class PaymentRepoImpl implements PaymentRepo {
  @override
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    try {
      await StripeServices().makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return const Right(null);
    } on StripeException catch (e) {
      return Left(ServerFailure(e.error.message ?? "Some thing went wrong"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
