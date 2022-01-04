import 'package:ecommerce_app_isaatech/screens/home/main_home.dart';
import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:ecommerce_app_isaatech/screens/product_page.dart';
import 'package:ecommerce_app_isaatech/screens/signup.dart';
import 'package:ecommerce_app_isaatech/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.id:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case SignUpScreen.id:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case ProductPage.id:
        return MaterialPageRoute(builder: (context) => const ProductPage());
      case MainScreen.id:
        return MaterialPageRoute(
            builder: (context) => MainScreen(
                  child: Container(),
                ));

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
