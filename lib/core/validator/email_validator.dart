import 'package:flutter/material.dart';

mixin EmailFormatter<T extends StatefulWidget> on State<T> {
   String? serverFirstNameError;

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Введите Логин или email';
    } if (isEmail(value) ==false) {
      return 'не корректный email';
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    return null;
  }

}

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
