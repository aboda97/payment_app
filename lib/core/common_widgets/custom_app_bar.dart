import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

AppBar buildAppBar({
  final String? title,
  final void Function()? onPressed,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: AppStyles.style25,
    ),
  );
}
