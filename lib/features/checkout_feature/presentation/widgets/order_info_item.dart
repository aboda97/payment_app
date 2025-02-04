import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String orderItemName;
  final String orderItemPrice;
  const OrderInfoItem({
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
          style: AppStyles.style18,
        ),
        Spacer(),
        Text(
          r'$' '$orderItemPrice',
          style: AppStyles.style18,
        ),
      ],
    );
  }
}
