import 'package:ecommerce_app_isaatech/components/buttons.dart';
import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:ecommerce_app_isaatech/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreenProductCard extends StatefulWidget {
  const HomeScreenProductCard(
      {Key? key, required this.product, required this.isCurrentInView})
      : super(key: key);

  final Product product;
  final bool isCurrentInView;

  @override
  _HomeScreenProductCardState createState() => _HomeScreenProductCardState();
}

class _HomeScreenProductCardState extends State<HomeScreenProductCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(top: 90, left: 8, right: 8, bottom: 20),
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
                    child: RoundedAddButton(
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          ).px(12),
        ),
        Container(
          decoration: BoxDecoration(
              color: widget.product.colorAccent,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 12),
                    spreadRadius: 1,
                    blurRadius: 12),
              ],
              borderRadius: BorderRadius.circular(24)),
          margin:
              const EdgeInsets.only(bottom: 145, left: 25, right: 25, top: 24),
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(widget.product.productImages[0]).p(12),
                Positioned(
                  right: 12,
                  top: 12,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink),
                          elevation: MaterialStateProperty.all(8),
                          shadowColor: MaterialStateProperty.all(Colors.pink)),
                      child: const Center(
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
