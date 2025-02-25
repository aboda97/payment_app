import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_paths.dart';
import 'package:payment_app/core/utils/api_services.dart';
import 'package:payment_app/features/checkout_feature/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  ApiServices apiServices = ApiServices();
  //------------------------------------------- MAIN STEPS -------------------------------------------------//

  // #1 PaymentIntentObject createPaymentIntent (amount, currency, customerId){}
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServices.postData(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: paymentIntentPath,
      token: ApiKeys.secretKey,
    );
    var paymentIntentData = PaymentIntentModel
        .fromIdPi3MtwBwLkdIwHu7ix28a3tqPaObjectPaymentIntentAmount2000AmountCapturable0AmountDetailsTipAmountReceived0ApplicationNullApplicationFeeAmountNullAutomaticPaymentMethodsEnabledTrueCanceledAtNullCancellationReasonNullCaptureMethodAutomaticClientSecretPi3MtwBwLkdIwHu7ix28a3tqPaSecretYrKjuKribcBjcG8HVhfZluoGhConfirmationMethodAutomaticCreated1680800504CurrencyUsdCustomerNullDescriptionNullInvoiceNullLastPaymentErrorNullLatestChargeNullLivemodeFalseMetadataNextActionNullOnBehalfOfNullPaymentMethodNullPaymentMethodOptionsCardInstallmentsNullMandateOptionsNullNetworkNullRequestThreeDSecureAutomaticLinkPersistentTokenNullPaymentMethodTypesCardLinkProcessingNullReceiptEmailNullReviewNullSetupFutureUsageNullShippingNullSourceNullStatementDescriptorNullStatementDescriptorSuffixNullStatusRequiresPaymentMethodTransferDataNullTransferGroupNull(
            response.data);
    return paymentIntentData;
  }

  // #2 KeySecret createEphemeralKey(customerId){}
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiServices.postData(
        body: {
          'customer': customerId,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: ephemeralKeyPath,
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2025-01-27.acacia',
        });
    var ephemeralData = EphemeralKeyModel
        .fromIdEphkey1QwM6Zcexz4cJg6ZiLh6h7UrObjectEphemeralKeyAssociatedObjectsIdCusRpmheGdwzozbb7TypeCustomerCreated1740482115Expires1740485715LivemodeFalseSecretEkTestYwNjdF8xUxRvcThDrVhaNgnkZzZaLEc0TUd2YkpwZGlXMzdtT243cnhjamhFTkttNxVrWg800Rq4Dqvsd(
            response.data);
    return ephemeralData;
  }

  // #3 intentPaymentSheet ( paymentIntentClientSecret/SetupPaymentSheetParameter ){}
  //OR #3 intentPaymentSheet ( merchantDisplayName, intentClientSecret, ephemeralKeySecret ){}
  // there i make setup for paymentSheet
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Flutter Stripe Demo',
        paymentIntentClientSecret:
            initPaymentSheetModel.paymentIntentClientSecret,
        customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKeySecret,
        customerId: initPaymentSheetModel.customerId,
      ),
    );
  }

  // #4 presentPaymentSheet();
  // there i make display for paymentSheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // ## Method for make the previous Steps Auto
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymenIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymenIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );

    await initPaymentSheet(
      initPaymentSheetModel: initPaymentSheetModel,
    );
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomer(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiServices.postData(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: customerPath,
      token: ApiKeys.secretKey,
    );
    var paymentIntentData = PaymentIntentModel
        .fromIdPi3MtwBwLkdIwHu7ix28a3tqPaObjectPaymentIntentAmount2000AmountCapturable0AmountDetailsTipAmountReceived0ApplicationNullApplicationFeeAmountNullAutomaticPaymentMethodsEnabledTrueCanceledAtNullCancellationReasonNullCaptureMethodAutomaticClientSecretPi3MtwBwLkdIwHu7ix28a3tqPaSecretYrKjuKribcBjcG8HVhfZluoGhConfirmationMethodAutomaticCreated1680800504CurrencyUsdCustomerNullDescriptionNullInvoiceNullLastPaymentErrorNullLatestChargeNullLivemodeFalseMetadataNextActionNullOnBehalfOfNullPaymentMethodNullPaymentMethodOptionsCardInstallmentsNullMandateOptionsNullNetworkNullRequestThreeDSecureAutomaticLinkPersistentTokenNullPaymentMethodTypesCardLinkProcessingNullReceiptEmailNullReviewNullSetupFutureUsageNullShippingNullSourceNullStatementDescriptorNullStatementDescriptorSuffixNullStatusRequiresPaymentMethodTransferDataNullTransferGroupNull(
            response.data);
    return paymentIntentData;
  }
}
