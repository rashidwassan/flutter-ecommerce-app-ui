import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({Key? key, required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.star, size: 19, color: CustomColors.starColor),
        4.widthBox,
        '($rating)'.text.sm.softWrap(true).make(),
      ],
    );
  }
}
