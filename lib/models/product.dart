import 'package:flutter/material.dart';

class Product {
  String name;
  String brand;
  String description;
  double price;
  double rating;
  Color colorAccent;
  List<String> productImages;

  Product(
      {required this.name,
      required this.brand,
      required this.description,
      required this.price,
      required this.rating,
      required this.colorAccent,
      required this.productImages});
}
