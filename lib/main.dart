import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:ecommerce_app_isaatech/screens/signup.dart';
import 'package:ecommerce_app_isaatech/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: Colors.white),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF999CF4),
          primaryVariant: Color(0xFF6569C0),
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
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
    );
  }
}
