import 'package:ecommerce_app_isaatech/components/buttons.dart';
import 'package:ecommerce_app_isaatech/components/main_page_product_card.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:ecommerce_app_isaatech/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

List<Product> products = [
  Product(
      name: 'Air Jordan 1 Mid',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      productImages: [Images.sh1, Images.sh2]),
  Product(
      name: 'Air Jordan 1 Mid',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      productImages: [Images.sh1, Images.sh2]),
  Product(
      name: 'Air Jordan 1 Mid',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      productImages: [Images.sh1, Images.sh2]),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchBar(context),
        _buildCategoriesCatalog(context),
        _buildProductPageView(),
        12.heightBox,
        _buildPopularTitle(),
        12.heightBox,
        _buildPopularProductCard(),
      ],
    ).py(16);
  }

  Widget _buildPopularProductCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 24),
          ]),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(Images.sh2).p(8),
          )
        ],
      ).p(8),
    ).px(24);
  }

  Widget _buildPopularTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        'Most Popular'.text.semiBold.xl2.make(),
        GestureDetector(
            onTap: () {}, child: 'View all'.text.underline.semiBold.make()),
      ],
    ).px(24);
  }

  Expanded _buildProductPageView() {
    return Expanded(
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.60, initialPage: 1),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return HomeScreenProductCard(
                product: products[index],
              );
            }));
  }

  SizedBox _buildCategoriesCatalog(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: (index == 0)
                  ? const SizedBox(
                      width: 12,
                    )
                  : (_selectedCategory == index)
                      ? SizedBox(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryShadowedButton(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: _buildWhiteCategoryButton(
                                                  context, index))
                                          .p(5),
                                      Text(
                                        'Sneakers $index',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ).px(8),
                                      12.widthBox,
                                    ],
                                  ),
                                  onPressed: () {},
                                  borderRadius: 80,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ],
                          ),
                        )
                      : _buildWhiteCategoryButton(context, index),
            );
          }),
    );
  }

  Widget _buildWhiteCategoryButton(BuildContext context, int index) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 16)
          ]),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
        child: SvgPicture.asset(Images.sneakers).p(10),
      ),
    );
  }

  Padding _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.search, color: Colors.grey)
                          .px(16),
                      const Flexible(
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        16.widthBox,
        SizedBox(
          height: 50,
          child: PrimaryShadowedButton(
            onPressed: () {},
            child: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.surface)
                .px(16),
            borderRadius: 12,
            color: Colors.black,
          ),
        )
      ],
    ).px(24);
  }
}
