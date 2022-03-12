import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/res/colors.dart';
import 'package:flutter_template/res/images.dart';
import 'package:flutter_template/res/text_styles.dart';
import 'package:flutter_template/res/texts.dart';
import 'package:flutter_template/res/urls.dart';
import 'package:flutter_template/res/pages.dart';

class Res {
  static final ResColors colors = ResColors();
  static final ResImages images = ResImages();
  static final ResTextStyles textStyles = ResTextStyles();
  static final ResUrls urls = ResUrls();
  static final ResTexts texts = ResTexts();
  static final ResPages pages = ResPages();

  static ThemeData themeData({ThemeMode? themeMode}) => ThemeData(
        fontFamily: "flutter_template",
        primaryColor: Res.colors.accent,
        primaryColorDark: Res.colors.primary(themeMode: ThemeMode.dark),
        primaryColorLight: Res.colors.primary(themeMode: ThemeMode.light),
        scaffoldBackgroundColor: Res.colors.back(themeMode: themeMode),
        colorScheme: Res.colorScheme(themeMode: themeMode),
        textTheme: Res.textTheme(themeMode: themeMode),
      );

  static ColorScheme colorScheme({ThemeMode? themeMode}) => ColorScheme(
        primary: Res.colors.primary(themeMode: themeMode),
        primaryVariant:
            Res.colors.darken(Res.colors.primary(themeMode: themeMode)),
        secondary: Res.colors.secondary(themeMode: themeMode),
        secondaryVariant:
            Res.colors.darken(Res.colors.secondary(themeMode: themeMode)),
        surface: Res.colors.surface(themeMode: themeMode),
        background: colors.back(themeMode: themeMode),
        error: Res.colors.error(themeMode: themeMode),
        onPrimary: Res.colors.onPrimary(themeMode: themeMode),
        onSecondary: Res.colors.onSecondary(themeMode: themeMode),
        onSurface: Res.colors.onSurface(themeMode: themeMode),
        onBackground: Res.colors.onBack(themeMode: themeMode),
        onError: Res.colors.onError(themeMode: themeMode),
        brightness: Res.colors.brightness(themeMode: themeMode),
      );

  static TextTheme textTheme({ThemeMode? themeMode}) => TextTheme(
        headline1: Res.textStyles.headline1(themeMode: themeMode),
        headline3: Res.textStyles.headline3(themeMode: themeMode),
        headline2: Res.textStyles.headline2(themeMode: themeMode),
        headline4: Res.textStyles.headline4(themeMode: themeMode),
        headline5: Res.textStyles.headline5(themeMode: themeMode),
        headline6: Res.textStyles.headline6(themeMode: themeMode),
        subtitle1: Res.textStyles.subtitle1(themeMode: themeMode),
        subtitle2: Res.textStyles.subtitle2(themeMode: themeMode),
        bodyText1: Res.textStyles.body1(themeMode: themeMode),
        bodyText2: Res.textStyles.body2(themeMode: themeMode),
        caption: Res.textStyles.caption(themeMode: themeMode),
        button: Res.textStyles.button(themeMode: themeMode),
      );

  static List<GetPage> getPages() => [
        Res.pages.splash,
        Res.pages.login,
        Res.pages.home,
      ];
}
