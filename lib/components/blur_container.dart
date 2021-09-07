import 'package:flutter/material.dart';
import 'dart:ui';

class BlurContainer extends StatelessWidget {
  const BlurContainer({Key? key, this.value = 0}) : super(key: key);

  final double value;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: value,
        sigmaY: value,
      ),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
