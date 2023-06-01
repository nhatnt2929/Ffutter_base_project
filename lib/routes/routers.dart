import 'package:flutter/material.dart';
import 'package:pes/presentation/pages/dieukhien/dieukhien_page.dart';
import 'package:pes/presentation/pages/giamsat/giamsat_page.dart';
import 'package:pes/presentation/pages/page.dart';
import 'package:pes/presentation/pages/tabar_page.dart';

abstract class AppRouter {
  static const String initialRoute = '/';
  static const String plashRoute = '/plash';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';

  static const String tabbarRoute = '/tabbar';
  static const String dieukhienRoute = '/control';
  static const String giamsatRoute = '/giamsat';

  static Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const PlashPage(),
    plashRoute: (context) => const PlashPage(),
    loginRoute: (context) => const LoginPage(),
    tabbarRoute: (context) => const Tabbar(),
    dieukhienRoute: (context) => const DieuKhienPage(),
    giamsatRoute: (context) => const GiamSatPage(),
  };
}
