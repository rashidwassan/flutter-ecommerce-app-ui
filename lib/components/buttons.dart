import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onBackground)),
        SizedBox(
          child: MaterialButton(
            splashColor: CustomColors.customGrey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
            padding: const EdgeInsets.all(0),
            onPressed: onPressed,
            child: Transform.rotate(
                angle: 4.71239,
                child: LottieBuilder.asset(
                  Images.proceed,
                  height: 80,
                  frameRate: FrameRate(60),
                )),
          ),
        ),
      ],
    );
  }
}

class PrimaryShadowedButton extends StatelessWidget {
  const PrimaryShadowedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.borderRadius,
      required this.color})
      : super(key: key);

  final Widget child;
  final double borderRadius;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const RadialGradient(
                colors: [Colors.black54, Colors.black],
                center: Alignment.topLeft,
                radius: 2),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(0.25),
                  offset: const Offset(3, 2),
                  spreadRadius: 1,
                  blurRadius: 8)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}

class RoundedAddButton extends StatelessWidget {
  const RoundedAddButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(
          FontAwesomeIcons.plus,
          size: 18,
          color: Theme.of(context).colorScheme.surface,
        ).centered(),
        onPressed: onPressed,
        color: Colors.black);
  }
}
