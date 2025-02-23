import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failure.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePaymentRepo({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
