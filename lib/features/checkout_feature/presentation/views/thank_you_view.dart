import 'package:flutter/material.dart';
import 'package:payment_app/core/common_widgets/custom_app_bar.dart';
import 'package:payment_app/features/checkout_feature/presentation/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ThankYouViewBody(),
    );
  }
}
