import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_app/core/errors/failure.dart';
import 'package:payment_app/core/utils/stripe_service.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/repositories/payment_reo.dart';

class PaymentRepoImplementation extends PaymentRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePaymentRepo({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
