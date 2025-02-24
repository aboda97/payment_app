import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_paths.dart';
import 'package:payment_app/core/utils/api_services.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  ApiServices apiServices = ApiServices();
  //------------------------------------------- MAIN STEPS -------------------------------------------------//

  // #1 PaymentIntentObject createPaymentIntent (amount, currency){}
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServices.postData(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: paymentIntentPath,
      token: ApiKeys.sercretKay,
    );
    var paymentIntentData = PaymentIntentModel
        .fromIdPi3MtwBwLkdIwHu7ix28a3tqPaObjectPaymentIntentAmount2000AmountCapturable0AmountDetailsTipAmountReceived0ApplicationNullApplicationFeeAmountNullAutomaticPaymentMethodsEnabledTrueCanceledAtNullCancellationReasonNullCaptureMethodAutomaticClientSecretPi3MtwBwLkdIwHu7ix28a3tqPaSecretYrKjuKribcBjcG8HVhfZluoGhConfirmationMethodAutomaticCreated1680800504CurrencyUsdCustomerNullDescriptionNullInvoiceNullLastPaymentErrorNullLatestChargeNullLivemodeFalseMetadataNextActionNullOnBehalfOfNullPaymentMethodNullPaymentMethodOptionsCardInstallmentsNullMandateOptionsNullNetworkNullRequestThreeDSecureAutomaticLinkPersistentTokenNullPaymentMethodTypesCardLinkProcessingNullReceiptEmailNullReviewNullSetupFutureUsageNullShippingNullSourceNullStatementDescriptorNullStatementDescriptorSuffixNullStatusRequiresPaymentMethodTransferDataNullTransferGroupNull(
            response.data);
    return paymentIntentData;
  }

  // #2 intentPaymentSheet ( paymentIntentClientSecret){}
  // there i make setup for paymentSheet
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Flutter Stripe Demo',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  // #3 presentPaymentSheet();
  // there i make display for paymentSheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // ## Method for make the previous Steps Auto
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymenIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymenIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
