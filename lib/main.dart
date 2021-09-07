import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:ecommerce_app_isaatech/screens/signup.dart';
import 'package:ecommerce_app_isaatech/screens/splash_screen.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFF999CF4),
          primaryVariant: const Color(0xFF6569C0),
          secondary: const Color(0xFFEFC3FE),
          secondaryVariant: Colors.green.shade700,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.blue,
          background: Colors.white,
          error: Colors.red,
          onBackground: Colors.black87,
          onError: Colors.white,
        ),
      ),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
    );
  }
}
