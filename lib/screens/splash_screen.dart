import 'dart:ui';

import 'package:ecommerce_app_isaatech/components/blur_container.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNext() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(LoginScreen.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                Images.loginBg,
              ),
              fit: BoxFit.cover,
            )),
          ),
          BlurContainer(
            value: 2,
          ),
          Center(
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset(Images.logo))
                .p(32),
          )
        ],
      ),
    );
  }
}
