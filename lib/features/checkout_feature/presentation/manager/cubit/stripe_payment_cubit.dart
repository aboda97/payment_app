import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/core/errors/failure.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/repositories/payment_reo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final PaymentRepo paymentRepo;
  StripePaymentCubit(this.paymentRepo) : super(StripePaymentInitial());
  Future makePaymentCubit(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var data = await paymentRepo.makePaymentRepo(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (l) => emit(
        StripePaymentFailure(failure: l),
      ),
      (r) => emit(
        StripePaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
