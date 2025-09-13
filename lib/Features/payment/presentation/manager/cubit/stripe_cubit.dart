import 'package:bloc/bloc.dart';
import 'package:docnow_app/Features/payment/data/models/Payment_Intent_Input_model.dart';
import 'package:docnow_app/Features/payment/data/repo/payment_repo_impl.dart';
import 'package:meta/meta.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit() : super(StripeInitial());
  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripeLoading());
    var result = await PaymentRepoImpl().makePayment(paymentIntentInputModel);
    result.fold(
      (failure) => emit(StripeFailure(failure.errMessge)),
      (r) => emit(StripeSuccess()),
    );
  }
}
