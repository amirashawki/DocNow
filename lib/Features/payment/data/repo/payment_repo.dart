import 'package:dartz/dartz.dart';
import 'package:docnow_app/Features/payment/data/models/Payment_Intent_Input_model.dart';
import 'package:docnow_app/core/errors/failures.dart';

abstract class PaymentRepo{
  Future<Either<Failure,void>> makePayment(PaymentIntentInputModel paymentIntentInputModel);
}
