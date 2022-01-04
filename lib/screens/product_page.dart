import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/buttons.dart';
import '../models/product.dart';

class ProductPage extends StatefulWidget {
  static const String id = '/ProductPage';
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes'),
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
