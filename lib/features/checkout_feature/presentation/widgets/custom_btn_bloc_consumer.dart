import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/common_widgets/custom_btn.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout_feature/data/models/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout_feature/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout_feature/presentation/views/thank_you_view.dart';

class customBtnBlocConsumer extends StatelessWidget {
  const customBtnBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        } else if (state is StripePaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(
            content: Text(state.failure.errMsg),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return SizedBox(
           width: screenWidth * 0.8,
          child: CustomBtn(
            isLoading: state is StripePaymentLoading ? true : false,
            text: 'Continue',
            onPressed: () {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: 1000,
                currency: 'USD',
                customerId: ApiKeys.customerId,
              );
              BlocProvider.of<StripePaymentCubit>(context).makePaymentCubit(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}
