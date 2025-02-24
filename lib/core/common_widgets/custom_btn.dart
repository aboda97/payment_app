import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isLoading;

  const CustomBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : Text(
              text,
              style: AppStyles.style22,
            ),
    );
  }
}
