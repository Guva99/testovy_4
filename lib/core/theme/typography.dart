import 'package:flutter/material.dart';

abstract class AppTypography {
  static const fontFamily = 'Manrope';
  static const fontFamilyBold = 'ManropeVariable';

  static const _base = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
  );

  static const h1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 46,
  );

  static const boldEffect = TextStyle(
    fontFamily: fontFamilyBold,
    fontWeight: FontWeight.w800,
    fontSize: 25,
  );

  static final h2 = _base.copyWith(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 30 / 32,
  );

  static final h3 = _base.copyWith(
    fontSize: 28,
    height: 30 / 28,
  );

  static final h4 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 28 / 26,
  );

  static final h5 = _base.copyWith(
    fontSize: 18,
  );

  static final body = _base.copyWith(
    fontSize: 15,
    height: 26 / 18,
  );

  static final paragraphP1 = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 26 / 18,
  );

  static final paragraphP2 = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 18 / 16,
  );
  static final paragraphP3 = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 18 / 16,
  );

  static final paragraphP2Semi = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 18 / 16,
  );

  static final paragraphP1Semi = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 28 / 24,
  );

  static final headingP3 = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 17 / 14,
  );

  static final headingP3Semi = _base.copyWith(
    fontSize: 14,
    height: 16 / 14,
  );

  static final caption = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 14 / 12,
  );

  static final captionSemi = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 16 / 14,
  );
  static final intr = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 22,
  );




}

extension Weights on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get heavy => copyWith(fontWeight: FontWeight.w800);
}
