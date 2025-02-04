import 'package:flutter/material.dart';
import 'package:payment_app/core/common_widgets/custom_app_bar.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/my_card_view_body.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'My Card',
      ),
      body: MyCardViewBody(),
    );
  }
}
