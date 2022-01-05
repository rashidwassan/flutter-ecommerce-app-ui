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
      productColors: [
        Colors.red.shade300,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh1,
        Images.sh2
      ]),
  Product(
      name: 'Nike High Run',
      brand: 'nike',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 235,
      rating: 5,
      productColors: [
        Colors.blue.shade200,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh2,
        Images.sh3
      ]),
  Product(
      name: 'Random Shoe',
      brand: 'adidas',
      description:
          'The Air Jordan 1 Mid shoe is inspired by the first AJ1, offering fans of Jordan retros a chance to follow in the footsteps of the greatness.',
      price: 80,
      rating: 4,
      productColors: [
        Colors.teal.shade300,
        Colors.teal.shade400,
        Colors.purple.shade400,
        Colors.blue.shade400
      ],
      productImages: [
        Images.sh3,
        Images.sh2
      ]),
];
