import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/assets_path.dart';
import 'package:payment_app/core/common_widgets/custom_btn.dart';
import 'package:payment_app/features/checkout_feature/data/repositories/payment_repo_implementation.dart';
import 'package:payment_app/features/checkout_feature/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/order_info_item.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/payment_method_bottom_sheet.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/total_order_info_price.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
      ),
      child: ListView(
        children: [
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            height: screenHeight * 0.55,
            child: Image.asset(
              AssetsPath.basketImgAsset,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          OrderInfoItem(
            orderItemName: 'Order Subtotal',
            orderItemPrice: '42.97',
          ),
          SizedBox(height: screenHeight * 0.01),
          OrderInfoItem(
            orderItemName: 'Discount',
            orderItemPrice: '0',
          ),
          SizedBox(height: screenHeight * 0.01),
          OrderInfoItem(
            orderItemName: 'Shipping',
            orderItemPrice: '8',
          ),
          Divider(
            color: Colors.black,
            thickness: 0.5,
          ),
          TotalOrderInfoPrice(
            orderItemName: 'Total',
            orderItemPrice: '50.97',
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth * 0.9,
            child: CustomBtn(
              text: 'Complete Payment',
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PaymentDetails();
                //     },
                //   ),
                // );
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    builder: (context) {
                      return BlocProvider(
                        create: (context) => StripePaymentCubit(
                          PaymentRepoImplementation(),
                        ),
                        child: PaymentMethodBottomSheet(),
                      );
                    });
              },
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
