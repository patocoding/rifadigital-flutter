import "package:firstly/utils/theme/custom_themes/app_bar_theme.dart";
import "package:firstly/utils/theme/custom_themes/bottom_sheet_theme.dart";
import "package:firstly/utils/theme/custom_themes/checkbox_theme.dart";
import "package:firstly/utils/theme/custom_themes/chip_theme.dart";
import "package:firstly/utils/theme/custom_themes/elevated_button_theme.dart";
import "package:firstly/utils/theme/custom_themes/text_field_theme.dart";
import "package:firstly/utils/theme/custom_themes/text_theme.dart";
import "package:flutter/material.dart";

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme
  );

  
}