import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'colors.dart';

class MaterialThemeData {
  static final themeData = ThemeData(
    colorScheme: _colorScheme,
    fontFamily: 'gilroy',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: _colorScheme.primary,
      titleTextStyle: const TextStyle(
        color: colorText,
        fontSize: 18,
        fontFamily: "gilroy",
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
      elevation: 0,
      iconTheme: const IconThemeData(color: colorText),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: colorOnPrimary,
          statusBarIconBrightness: Brightness.dark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((states) => colorSelectedButton),
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorScheme.primary,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: colorAccent,
    ),
    canvasColor: _colorScheme.background,
    highlightColor: Colors.transparent,
    indicatorColor: _colorScheme.onPrimary,
    primaryColor: _colorScheme.primary,
    scaffoldBackgroundColor: _colorScheme.background,
    typography: Typography.material2018(
      platform: defaultTargetPlatform,
    ),
  );

  static const _colorScheme = ColorScheme(
      primary: Colors.white,
      secondary: colorAccent,
      background: colorOnPrimary,
      surface: Color(0xFFF2F2F2),
      onBackground: Colors.black,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      brightness: Brightness.light);
}
