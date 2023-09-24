import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/core/constants/app_sizes.dart';

class AppThemeData {
  AppThemeData._();

  static const Color _backgroundColor = Colors.blueGrey;

  static const Color _primary = Colors.white;
  static const Color _secondary = Colors.yellow;

  static const Color _error = Color(0xffEB5757);

  static const Color secondBackgroundColor = Color(0xffF3F4F8);

  static const Color lightGreyColor = Color(0xFFCED1D6);
  static const Color darkGreyColor = Color(0xFF5F6062);
  static const Color borderGreyColor = Color(0xFF979797);
  static const Color borderColor = Color(0xFFD9D9D9);
  static const Color indicatorColor = Color(0xFFE5F1FB);
  static const Color darkTextColor = Color(0xFF2D2D2D);
  static const Color lightTextColor = Color(0xFF7C7C7C);
  static const Color blueTextColor = Color(0xFF0570A9);
  static const Color green = Color(0xFF28B446);
  static const Color red = Color(0xFFF7685B);
  static const Color darkRed = Color(0xFFDE5753);
  static const Color grey50 = Color(0xFFF8F8F8);
  static const Color productColor = Color(0xFF800080);
  static const Color partColor = Color(0xFF337ab7);
  static const Color chemicalColor = Color(0xFFffc900);
  static const Color othersColor = Color(0xFF64dd17);

  // container color
  static const Color cntrBlueColor = Color(0xFF0FB6EA);
  static const Color cntrPurpleColor = Color(0xFF9066B4);

  static ThemeData lightThemeData = themeData(_lightColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      splashColor: Colors.white.withOpacity(0.2),
      highlightColor: Colors.white.withOpacity(0.2),
      unselectedWidgetColor: Colors.grey.shade300,
      dividerColor: lightGreyColor.withOpacity(0.5),
      hintColor: lightGreyColor,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: lightGreyColor,
        labelStyle: TextStyle(
          fontSize: Sizes.s18,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: Sizes.s18,
          fontWeight: FontWeight.w500,
          color: lightGreyColor,
        ),
        indicator: BoxDecoration(color: Colors.white),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionHandleColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withOpacity(0.2),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.background,
        iconTheme: IconThemeData(color: colorScheme.primary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: lightGreyColor,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.background,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        modalElevation: 0,
        backgroundColor: colorScheme.background,
        modalBackgroundColor: colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: _primary,
    onPrimary: _primary,
    primaryContainer: _backgroundColor,
    secondary: _secondary,
    onSecondary: _secondary,
    background: _backgroundColor,
    onBackground: _backgroundColor,
    error: _error,
    onError: _error,
    surface: _backgroundColor,
    onSurface: _backgroundColor,
    brightness: Brightness.light,
  );
}
