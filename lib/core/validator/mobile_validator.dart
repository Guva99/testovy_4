import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
 mixin PhoneFormatter<T extends StatefulWidget> on State<T> {
  static const _kNamePattern = r"^[а-яА-Я\u0401\u0451 -]{1,30}$";

  String? serverFirstNameError;

  String?  phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите Номер телефона';
    }
    if(value.length<12){
      return 'Номер должен содержать 11 цифр';
    }else{
      FocusManager.instance.primaryFocus?.unfocus();
    }
    return null;
  }
  final maskFormatterNumber = MaskTextInputFormatter(
    mask: '+7 ### ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );

 }
