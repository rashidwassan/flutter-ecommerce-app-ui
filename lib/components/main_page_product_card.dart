import 'package:ecommerce_app_isaatech/components/buttons.dart';
import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreenProductCard extends StatefulWidget {
  const HomeScreenProductCard({Key? key, required this.product})
      : super(key: key);

  final Product product;

  @override
  _HomeScreenProductCardState createState() => _HomeScreenProductCardState();
}

class _HomeScreenProductCardState extends State<HomeScreenProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    offset: const Offset(0, 12),
                    spreadRadius: 1,
                    blurRadius: 24),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: widget.product.name.text
                        .size(19)
                        .semiBold
                        .softWrap(true)
                        .make(),
                  ),
                  const Icon(Icons.star, color: CustomColors.starColor),
                  4.widthBox,
                  '(${widget.product.rating})'
                      .text
                      .medium
                      .softWrap(true)
                      .make()
                      .pOnly(top: 4),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.product.brand
                          .toUpperCase()
                          .text
                          .semiBold
                          .color(Colors.grey)
                          .softWrap(true)
                          .make()
                          .py(4),
                      '\$${widget.product.price}'
                          .text
                          .size(16)
                          .semiBold
                          .softWrap(true)
                          .make(),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: MaterialButton(
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          size: 18,
                          color: Theme.of(context).colorScheme.surface,
                        ).centered(),
                        onPressed: () {},
                        color: Colors.black),
                  )
                ],
              ),
            ],
          ).p(12),
        ),
      ],
    );
  }
}
