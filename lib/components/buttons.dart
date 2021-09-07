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
          width: 70,
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
