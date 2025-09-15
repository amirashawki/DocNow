import 'package:dartz/dartz.dart';
import 'package:docnow_app/core/errors/failures.dart';
import 'package:docnow_app/Features/payment/data/models/payment_intent_input_model.dart';


abstract class PaymentRepo{
  Future<Either<Failure,void>> makePayment(PaymentIntentInputModel paymentIntentInputModel);
}
