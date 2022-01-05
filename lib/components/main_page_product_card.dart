import 'package:ecommerce_app_isaatech/components/buttons.dart';
import 'package:ecommerce_app_isaatech/components/rating_widget.dart';
import 'package:ecommerce_app_isaatech/models/product.dart';
import 'package:ecommerce_app_isaatech/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class _HomeScreenProductCardState extends State<HomeScreenProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageAnimationController;

  @override
  void initState() {
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    super.initState();

    _imageAnimationController.addListener(() {
      setState(() {});
    });
    _imageAnimationController.forward();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            margin:
                const EdgeInsets.only(top: 110, left: 8, right: 8, bottom: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.12),
                      offset: const Offset(0, 12),
                      spreadRadius: 1,
                      blurRadius: 24),
                ]),
            child: Container(
              width: double.infinity,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductPage.id,
                  arguments: widget.product,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: widget.product.colorAccent,
                    boxShadow: [
                      widget.isCurrentInView
                          ? BoxShadow(
                              color: Colors.grey.shade200,
                              offset: const Offset(0, 8),
                              spreadRadius: 1,
                              blurRadius: 8)
                          : const BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(0, 8),
                            ),
                    ],
                    borderRadius: BorderRadius.circular(24)),
                // margin: const EdgeInsets.only(
                //     left: 25, right: 25, top: 24, bottom: 32),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 0.9,
                      child: Transform.rotate(
                          angle: widget.isCurrentInView
                              ? (_imageAnimationController.value * 0.5)
                              : 0,
                          child: Image.asset(
                            widget.product.productImages[0],
                          ).p(16)),
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: SizedBox(
                          height: _imageAnimationController.value * 27,
                          width: _imageAnimationController.value * 27,
                          child: FavouriteButton(
                            iconSize: _imageAnimationController.value * 17,
                            onPressed: () {},
                          )),
                    )
                  ],
                ),
              ),
            ).p(24),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: widget.product.name.text
                            .size(18)
                            .semiBold
                            .maxLines(2)
                            .softWrap(true)
                            .make(),
                      ),
                      12.widthBox,
                      RatingWidget(rating: widget.product.rating),
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
                              .size(15)
                              .semiBold
                              .softWrap(true)
                              .make(),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: _imageAnimationController.value * 30,
                        width: _imageAnimationController.value * 30,
                        child: RoundedAddButton(
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ).px(24).pOnly(bottom: 28),
            )
          ],
        )
      ],
    );
  }
}
