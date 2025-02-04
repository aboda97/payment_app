import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
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
