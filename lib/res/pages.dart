import 'package:get/get.dart';
import 'package:flutter_template/pages/splash.dart';
import 'package:flutter_template/pages/login.dart';
import 'package:flutter_template/pages/home.dart';

class ResPages {
  final dynamic splash = GetPage(name: '/', page: () => const Splash());
  final dynamic login = GetPage(name: '/login', page: () => const Login());
  final dynamic home = GetPage(name: '/home', page: () => const Home());
}
