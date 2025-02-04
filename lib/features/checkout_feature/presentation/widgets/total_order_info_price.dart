import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class TotalOrderInfoPrice extends StatelessWidget {
  final String orderItemName;
  final String orderItemPrice;
  const TotalOrderInfoPrice({
    super.key,
    required this.orderItemName,
    required this.orderItemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          orderItemName,
          style: AppStyles.style24,
        ),
        Spacer(),
        Text(
          r'$' '$orderItemPrice',
          style: AppStyles.style24,
        ),
      ],
    );
  }
}
