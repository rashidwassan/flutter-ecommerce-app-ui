import 'package:ecommerce_app_isaatech/route_generator.dart';
import 'package:ecommerce_app_isaatech/screens/home/home_screens/home_screen.dart';
import 'package:ecommerce_app_isaatech/screens/home/main_home.dart';
import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:ecommerce_app_isaatech/screens/product_page.dart';
import 'package:ecommerce_app_isaatech/screens/signup.dart';
import 'package:ecommerce_app_isaatech/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const EcommerceAppIsaatech());
}

class EcommerceAppIsaatech extends StatelessWidget {
  const EcommerceAppIsaatech({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Isaatech Ecommerce',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        fontFamily: 'Gilroy',
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0F1327),
          primaryVariant: Color(0xFF0F0317),
          secondary: Color(0xFFEFC3FE),
          secondaryVariant: Color(0xFF9F83BE),
          onPrimary: Colors.white,
          surface: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black87,
          background: Colors.white,
          error: Colors.red,
          onBackground: Colors.black87,
          onError: Colors.white,
        ),
      ),
      initialRoute: SplashScreen.id,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
