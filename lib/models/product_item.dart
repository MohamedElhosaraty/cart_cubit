import 'package:flutter/material.dart';




class Product_Item {
  final int id;
  final Color color;
  final String name;
  final double price;

  bool isAdd = false;


  Product_Item({
    required this.id,
    required this.color,
    required this.name,
    required this.price,
  });
}


