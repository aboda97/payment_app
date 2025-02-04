import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/assets_path.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/payment_container_items.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/payment_item_list_view.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenHeight * .02,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: screenHeight * .02,
          ),
          PaymentMethodsListView(),
        ],
      ),
    );
  }
}
