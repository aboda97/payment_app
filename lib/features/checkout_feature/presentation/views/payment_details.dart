import 'package:flutter/material.dart';
import 'package:payment_app/core/common_widgets/custom_app_bar.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/payment_details_body.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details',
      ),
      body: PaymentDetailsBody(),
    );
  }
}
