import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/res.dart';
import 'package:flutter_template/pages/splash.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_template',
      home: const Splash(),
      theme: Res.themeData(themeMode: ThemeMode.light),
      darkTheme: Res.themeData(themeMode: ThemeMode.dark),
      themeMode: ThemeMode.system,
      translations: Res.texts,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: '/',
      getPages: Res.getPages(),
    );
  }
}
