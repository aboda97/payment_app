import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/custom_btn_bloc_consumer.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/payment_item_list_view.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 16.0,
        ),
        PaymentMethodsListView(),
        SizedBox(
          height: 32.0,
        ),
        customBtnBlocConsumer(),
      ],
    );
  }
}
