import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_list/themes/colors.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get backgroundButtonColor => brightness == Brightness.light
      ? ColorsLight.kBackgroundButtonColor
      : ColorsDark.kBackgroundButtonColor;
  Color get borderButtonColor => brightness == Brightness.light
      ? ColorsLight.kBorderButtonColor
      : ColorsDark.kBorderButtonColor;
  Color get borderColor => brightness == Brightness.light
      ? ColorsLight.kBorderColor
      : ColorsDark.kBorderColor;
  Color get fillColor => brightness == Brightness.light
      ? ColorsLight.kFillColor
      : ColorsDark.kFillColor;
  Color get selectColor => brightness == Brightness.light
      ? ColorsDark.kFillColor
      : ColorsLight.kFillColor;
  Color get iconColor => MyColors.kIconColor;
  Color get cursorColor => MyColors.kCursorColor;
}

extension Themes on ThemeData {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: inputDecorationTheme(
          borderColor: ColorsLight.kBorderColor,
          fillColor: ColorsLight.kFillColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: textTheme(
          bodyTextColor: ColorsLight.kTaskNameTextColor,
          headLineTextColor: ColorsLight.kTitleTextColor,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorsDark.kBackgroundColor,
        inputDecorationTheme: inputDecorationTheme(
          borderColor: ColorsDark.kBorderColor,
          fillColor: ColorsDark.kFillColor,
        ),
        textTheme: textTheme(
          bodyTextColor: ColorsDark.kTaskNameTextColor,
          headLineTextColor: ColorsDark.kTitleTextColor,
        ));
  }

  static textTheme(
          {required Color headLineTextColor, required Color bodyTextColor}) =>
      TextTheme(
        headline1: GoogleFonts.inter(
            fontWeight: FontWeight.w800,
            fontSize: 56.0,
            color: headLineTextColor),
        bodyText1: GoogleFonts.inter(
            fontWeight: FontWeight.w500, fontSize: 18.0, color: bodyTextColor),
      );

  static inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
  }) =>
      InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        isDense: true,
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
        ),
      );
}
