import 'package:flutter/material.dart';
import 'package:homeword/screen/home_screen.dart';
import 'package:homeword/screen/login_screen.dart';
import 'package:homeword/screen/main_screen.dart';
import 'package:homeword/screen/register_screen.dart';
import 'package:homeword/screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String mainScreen = '/main';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splashScreen:
        return _buildRoute(setting, SplashScreen());
      case mainScreen:
        return _buildRoute(setting, MainScreen());
      case homeScreen:
        return _buildRoute(setting, HomeScreen());
      case loginScreen:
        return _buildRoute(setting, LoginScreen());
      case registerScreen:
        return _buildRoute(setting, RegisterScreen());
      default:
        throw Exception('Route not found: ${setting.name}');
    }
  }

  static Route<dynamic> _buildRoute(RouteSettings setting, Widget newScreen) {
    return MaterialPageRoute(settings: setting, builder: (_) => newScreen);
  }
}
