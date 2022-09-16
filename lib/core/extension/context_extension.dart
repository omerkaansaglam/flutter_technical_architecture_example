import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double screenAwareSize(double val) => (val * 1.143) * (MediaQuery.of(this).size.width / 375);
}

extension StringLocalization on String {
  String get locale => this.tr();
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get smallPaddingValue => height * 0.02216;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtension on BuildContext {
  EdgeInsetsGeometry get normalPadding => const EdgeInsets.all(16);
  EdgeInsetsGeometry get lowPadding => const EdgeInsets.all(5);
  EdgeInsetsGeometry get horizontalNormalPadding => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsetsGeometry get horizontalLowPadding => const EdgeInsets.symmetric(horizontal: 5);
  EdgeInsetsGeometry get verticalLowPadding => const EdgeInsets.symmetric(vertical: 10);
  EdgeInsetsGeometry get rightHorizontalLowPadding => const EdgeInsets.only(right: 10);
}
