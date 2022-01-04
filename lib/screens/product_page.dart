import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../components/buttons.dart';
import '../components/rating_widget.dart';
import '../models/product.dart';

class ProductPage extends StatefulWidget {
  static const String id = '/ProductPage';
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          const BagButton(
            numberOfItemsPurchased: 3,
          ),
          16.widthBox,
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: 0.8,
                child: Container(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    margin: const EdgeInsets.only(
                        top: 110, left: 8, right: 8, bottom: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.20),
                              offset: const Offset(0, 24),
                              spreadRadius: 1,
                              blurRadius: 24),
                        ]),
                    child: Container(
                      width: double.infinity,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: widget.product.colorAccent,
                        borderRadius: BorderRadius.circular(24)),
                    // margin: const EdgeInsets.only(
                    //     left: 25, right: 25, top: 24, bottom: 32),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            widget.product.productImages[0],
                          ).p(16),
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: SizedBox(
                            height: _imageAnimationController.value * 35,
                            width: _imageAnimationController.value * 35,
                            child: TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.pink),
                                  elevation: MaterialStateProperty.all(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.pink)),
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  size: _imageAnimationController.value * 24,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ).p(24),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: widget.product.name.text
                                .size(24)
                                .semiBold
                                .maxLines(2)
                                .softWrap(true)
                                .make(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ColorSelector(colors: [
                            Colors.orange.shade400,
                            Colors.teal.shade400,
                            Colors.purple.shade400,
                            Colors.blue.shade400
                          ])
                        ],
                      ),
                    ],
                  ).px(24).pOnly(bottom: 28)
                ],
              ),
            ],
          )
        ],
      ).p(24),
    );
  }
}

class ColorSelector extends StatefulWidget {
  const ColorSelector({Key? key, required this.colors}) : super(key: key);
  final List<Color> colors;

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.colors.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: (_selectedIndex == index)
                        ? CustomColors.darkBlue
                        : Colors.transparent,
                    shape: BoxShape.circle),
                child: Center(
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.colors[index],
                        border: Border.all(width: 1.5, color: Colors.white)),
                  ),
                ).p(1),
              ).pOnly(right: 3),
            );
          },
        ),
      ),
    );
  }
}
