import 'package:flutter/material.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';


class GlobalSnackBar {
  static void show(
    BuildContext context, {
    String? message,
    Color? color,
    int? duration,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      duration: duration != null
          ? Duration(milliseconds: duration)
          : const Duration(seconds: 3),
      content: Container(
        height: 20.0,
        child: Center(
          child: FittedBox(
            child: Text(
              message!,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
      backgroundColor: color ?? AppColors.red,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
