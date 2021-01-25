import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final primaryIconsColor = Colors.black;
  static final primaryTextColor = Colors.black;
  static final secondaryTextColor = Color(0xFF808080);
  static final backgroundColor = Colors.white;
  static final hintTextColor = Color(0xFFBDBDBD);
  static final lightenHintTextColor = Color(0xFFEDEDED);
  static final lightenAccentColor = Color(0xFFF3FAFF);
  static final lightAccentColor = Color(0xFFE8F4FC);
  static final accentColor = Color(0xFF2196F3);

  static final onAccentColor = Colors.white;
  static final onSurfaceColor = Color(0xFF424242);
  static final onBackgroundColor = Color(0xFFF7F7F7);

  static final dividerColor = Color(0xFFE0E0E0);
  static final processColor = Color(0xFF18BFA5);
  static final lightProcessColor = Color(0xFFD2F4EF);
  static final lightenProcessColor = Color(0xFFF2FCFB);

  static final invariantPrimaryTextColor = Color(0xFF464646);
}

class AppFonts {
  static final openSans = "OpenSans";
  static final circe = "Circe";
  static final regular = FontWeight.w400;
  static final semibold = FontWeight.w600;
  static final bold = FontWeight.w700;
}

class AppRegex {
  static final deviceNameAllow = RegExp(r"^[a-zA-Zа-яА-Я0-9*-.!]{2,25}$");
}

class AppNavigation {
  static const deviceNameRouteName = "/auth";
  static const mainRouteName = "/main";
  static const settingsRouteName = "/main/settings";
  static const statisticsRouteName = "/main/statistics";
}

class AppOther {
  static final int maxInt =
      (double.infinity is int) ? double.infinity as int : ~minInt;
  static final int minInt =
      (double.infinity is int) ? -double.infinity as int : (-1 << 63);
}
