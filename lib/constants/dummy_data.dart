import '/constants/images.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

List<Product> products = [
  Product(
      name: 'Air Jordan 1 Mid',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 115,
      rating: 5,
      colorAccent: Colors.red.shade100,
      productImages: [Images.sh1, Images.sh2]),
  Product(
      name: 'Nike High Run',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 235,
      rating: 5,
      colorAccent: Colors.blue.shade200,
      productImages: [Images.sh2, Images.sh3]),
  Product(
      name: 'Random Shoe',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 5,
      colorAccent: Colors.yellow.shade100,
      productImages: [Images.sh3, Images.sh2]),
];
