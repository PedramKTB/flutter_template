import 'package:flutter/material.dart';
import 'package:flutter_template/provider/res/app_colors.dart';
import 'package:flutter_template/provider/res/app_images.dart';
import 'package:flutter_template/provider/res/app_text_styles.dart';
import 'package:flutter_template/provider/res/app_urls.dart';

class ResProvider with ChangeNotifier {
  static ThemeMode themeMode = ThemeMode.system;
  static final AppColors colors = AppColors();
  static final AppImages images = AppImages();
  static final AppTextStyles textStyles = AppTextStyles();
  static final AppUrls urls = AppUrls();

  static ThemeData themeData({ThemeMode? themeMode}) {
    return ThemeData(
      fontFamily: "flutter_template",
      primaryColor: ResProvider.colors.accent,
      primaryColorDark: ResProvider.colors.primary(themeMode: ThemeMode.dark),
      primaryColorLight: ResProvider.colors.primary(themeMode: ThemeMode.light),
      scaffoldBackgroundColor: ResProvider.colors.back(themeMode: themeMode),
      colorScheme: ResProvider.colorScheme(themeMode: themeMode),
      textTheme: ResProvider.textTheme(themeMode: themeMode),
    );
  }

  static TextTheme textTheme({ThemeMode? themeMode}) {
    return TextTheme(
      headline1: ResProvider.textStyles.headline1(themeMode: themeMode),
      headline3: ResProvider.textStyles.headline3(themeMode: themeMode),
      headline2: ResProvider.textStyles.headline2(themeMode: themeMode),
      headline4: ResProvider.textStyles.headline4(themeMode: themeMode),
      headline5: ResProvider.textStyles.headline5(themeMode: themeMode),
      headline6: ResProvider.textStyles.headline6(themeMode: themeMode),
      subtitle1: ResProvider.textStyles.subtitle1(themeMode: themeMode),
      subtitle2: ResProvider.textStyles.subtitle2(themeMode: themeMode),
      bodyText1: ResProvider.textStyles.body1(themeMode: themeMode),
      bodyText2: ResProvider.textStyles.body2(themeMode: themeMode),
      caption: ResProvider.textStyles.caption(themeMode: themeMode),
      button: ResProvider.textStyles.button(themeMode: themeMode),
    );
  }

  static ColorScheme colorScheme({ThemeMode? themeMode}) => ColorScheme(
        primary: ResProvider.colors.primary(themeMode: themeMode),
        primaryVariant: ResProvider.colors
            .darken(ResProvider.colors.primary(themeMode: themeMode)),
        secondary: ResProvider.colors.secondary(themeMode: themeMode),
        secondaryVariant: ResProvider.colors
            .darken(ResProvider.colors.secondary(themeMode: themeMode)),
        surface: ResProvider.colors.surface(themeMode: themeMode),
        background: colors.back(themeMode: themeMode),
        error: ResProvider.colors.error(themeMode: themeMode),
        onPrimary: ResProvider.colors.onPrimary(themeMode: themeMode),
        onSecondary: ResProvider.colors.onSecondary(themeMode: themeMode),
        onSurface: ResProvider.colors.onSurface(themeMode: themeMode),
        onBackground: ResProvider.colors.onBack(themeMode: themeMode),
        onError: ResProvider.colors.onError(themeMode: themeMode),
        brightness: ResProvider.colors.brightness(themeMode: themeMode),
      );

  void changeTheme({required ThemeMode themeMode}) {
    ResProvider.themeMode = themeMode;
    notifyListeners();
  }
}
