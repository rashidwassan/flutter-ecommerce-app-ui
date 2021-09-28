import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Row buildSignInGradientButtonRow(
    BuildContext context, String text, Function() onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(text,
          style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground)),
      16.widthBox,
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          gradient: RadialGradient(
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.primaryVariant,
            ],
            center: Alignment.topLeft,
            radius: 1.5,
          ),
        ),
        child: SizedBox(
          width: 65,
          height: 45,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(500)),
            padding: const EdgeInsets.all(0),
            onPressed: onPressed,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
      ),
    ],
  );
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
        height: 55,
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
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
