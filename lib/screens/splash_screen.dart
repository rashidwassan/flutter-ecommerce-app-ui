import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:ecommerce_app_isaatech/screens/login.dart';
import 'package:lottie/lottie.dart';
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
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customGrey,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.easeInOutBack,
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, val, child) => Material(
            color: CustomColors.halfWhite,
            elevation: 0,
            borderRadius: BorderRadius.circular(500),
            child: Lottie.asset(
              Images.splashAnim,
              frameRate: FrameRate(60),
              width: context.percentWidth * (double.parse(val.toString()) * 55),
            ),
          ),
        ),
      ),
    );
  }
}
