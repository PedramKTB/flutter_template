import 'package:flutter/material.dart';
import 'package:flutter_template/provider/res_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/pages/splash.dart';
import 'package:flutter_template/provider/auth_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ResProvider>(create: (_) => ResProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter_template',
        home: const Splash(),
        theme: ResProvider.themeData(themeMode: ThemeMode.light),
        darkTheme: ResProvider.themeData(themeMode: ThemeMode.dark),
        themeMode: ResProvider.themeMode,
      ),
    );
  }
}
