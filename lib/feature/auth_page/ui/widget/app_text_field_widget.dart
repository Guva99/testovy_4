import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testovy_zadanie4/core/theme/app_color.dart';
import 'package:testovy_zadanie4/core/theme/typography.dart';


class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    required this.labelText,
    required this.textEditingController,
    required this.inputType,
    this.validator,
    this.inputFormatters,
    this.height,
    this.maxLength,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  final double? height;
  final int? maxLength;
  final String labelText;
  final TextInputType inputType;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword; // Добавьте это поле

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      width: double.infinity,
      child: TextFormField(
        maxLength: maxLength,
        validator: validator,
        key: key,
        inputFormatters: inputFormatters,
        keyboardType: inputType,
        obscureText: isPassword, // Установите obscureText в зависимости от флага
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: labelText,
            errorStyle: const TextStyle(color: AppColors.red),
            hintStyle: AppTypography.body.copyWith(color: AppColors.grayLight),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.white),
            )),
        style: const TextStyle(color: AppColors.black),
      ),
    );
  }
}
