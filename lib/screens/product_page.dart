import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/buttons.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  static const String id = '/ProductPage';
  const ProductPage({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          const BagButton(
            numberOfItemsPurchased: 3,
          ),
          16.widthBox,
        ],
      ),
    );
  }
}
