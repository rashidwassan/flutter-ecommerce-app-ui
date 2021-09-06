import 'dart:ui';

import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(
              color: Colors.transparent,
            ),
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
