import 'package:flutter/material.dart';

class ResColors {
  final Color accent = const Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  final Color white = const Color.fromRGBO(0xFF, 0xFF, 0xFF, 1);
  final Color black = const Color.fromRGBO(0x00, 0x00, 0x00, 1);
  final Color red = const Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  final Color green = const Color.fromRGBO(0x00, 0xFF, 0x00, 1);
  final Color blue = const Color.fromRGBO(0x00, 0x00, 0xFF, 1);
  final Color yellow = const Color.fromRGBO(0xFF, 0xFF, 0x00, 1);
  final Color cyan = const Color.fromRGBO(0x00, 0xFF, 0xFF, 1);
  final Color purple = const Color.fromRGBO(0xFF, 0x00, 0xFF, 1);

  final int _variance = 0x10;
  static const Color _light = Color.fromRGBO(0xFF, 0xFF, 0xFF, 1);
  static const Color _dark = Color.fromRGBO(0x00, 0x00, 0x00, 1);
  static const Color _onLight = Color.fromRGBO(0xFF, 0xFF, 0xFF, 1);
  static const Color _onDark = Color.fromRGBO(0x00, 0x00, 0x00, 1);
  static const Color _primaryLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _primaryDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onPrimaryLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onPrimaryDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _secondaryLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _secondaryDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onSecondaryLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onSecondaryDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _surfaceLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _surfaceDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onSurfaceLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onSurfaceDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _errorLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _errorDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onErrorLight = Color.fromRGBO(0xFF, 0x00, 0x00, 1);
  static const Color _onErrorDark = Color.fromRGBO(0xFF, 0x00, 0x00, 1);

  Brightness brightness({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? Brightness.dark
          : Brightness.light
      : themeMode == ThemeMode.dark
          ? Brightness.dark
          : Brightness.light;
  Color darken(Color color) => Color.fromRGBO(
        color.red - _variance,
        color.green - _variance,
        color.blue - _variance,
        color.opacity,
      );
  Color brighten(Color color) => Color.fromRGBO(
        color.red + _variance,
        color.green + _variance,
        color.blue + _variance,
        color.opacity,
      );
  Color text({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _light
          : _dark
      : themeMode == ThemeMode.dark
          ? _light
          : _dark;
  Color back({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _dark
          : _light
      : themeMode == ThemeMode.dark
          ? _dark
          : _light;
  Color onBack({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _onDark
          : _onLight
      : themeMode == ThemeMode.dark
          ? _onDark
          : _onLight;
  Color primary({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _primaryDark
          : _primaryLight
      : themeMode == ThemeMode.dark
          ? _primaryDark
          : _primaryLight;
  Color onPrimary({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _onPrimaryDark
          : _onPrimaryLight
      : themeMode == ThemeMode.dark
          ? _onPrimaryDark
          : _onPrimaryLight;
  Color secondary({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _secondaryDark
          : _secondaryLight
      : themeMode == ThemeMode.dark
          ? _secondaryDark
          : _secondaryLight;
  Color onSecondary({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _onSecondaryDark
          : _onSecondaryLight
      : themeMode == ThemeMode.dark
          ? _onSecondaryDark
          : _onSecondaryLight;
  Color surface({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _surfaceDark
          : _surfaceLight
      : themeMode == ThemeMode.dark
          ? _surfaceDark
          : _surfaceLight;
  Color onSurface({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _onSurfaceDark
          : _onSurfaceLight
      : themeMode == ThemeMode.dark
          ? _onSurfaceDark
          : _onSurfaceLight;
  Color error({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _errorDark
          : _errorLight
      : themeMode == ThemeMode.dark
          ? _errorDark
          : _errorLight;
  Color onError({ThemeMode? themeMode}) => themeMode == null
      ? ThemeMode.system == ThemeMode.dark
          ? _onErrorDark
          : _onErrorLight
      : themeMode == ThemeMode.dark
          ? _onErrorDark
          : _onErrorLight;
}
