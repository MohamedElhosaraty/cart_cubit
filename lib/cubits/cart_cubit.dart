import 'package:bloc/bloc.dart';
import 'package:cart_cubit/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<Product_Item> productList = [
    Product_Item(
        id: 1,
        color: const Color(0xFF3498db),
        name: 'Blue Widget',
        price: 19.99),
    Product_Item(
        id: 2,
        color: const Color(0xFF2ecc71),
        name: 'Green Gadget',
        price: 29.99),
    Product_Item(
        id: 3, color: const Color(0xFFe74c3c), name: 'Red Gizmo', price: 14.99),
    Product_Item(
        id: 4,
        color: const Color(0xFFf39c12),
        name: 'Yellow Thingamajig',
        price: 24.99),
    Product_Item(
        id: 5,
        color: const Color(0xFF9b59b6),
        name: 'Purple Doohickey',
        price: 17.99),
    Product_Item(
        id: 6,
        color: const Color(0xFF34495e),
        name: 'Gray Contraption',
        price: 22.99),
    Product_Item(
        id: 7,
        color: const Color(0xFFd35400),
        name: 'Orange Whatchamacallit',
        price: 18.99),
    Product_Item(
        id: 8,
        color: const Color(0xFF1abc9c),
        name: 'Turquoise Widget',
        price: 16.99),
    Product_Item(
        id: 9,
        color: const Color(0xFF27ae60),
        name: 'Emerald Device',
        price: 31.99),
    Product_Item(
        id: 10,
        color: const Color(0xFFe74c3c),
        name: 'Red Gadget',
        price: 29.99),
    Product_Item(
        id: 91,
        color: const Color(0xFF8e44ad),
        name: 'Violet Gizmo',
        price: 12.99),
    Product_Item(
        id: 92,
        color: const Color(0xFFc0392b),
        name: 'Maroon Doohickey',
        price: 21.99),
    Product_Item(
        id: 93,
        color: const Color(0xFF2c3e50),
        name: 'Dark Gray Contraption',
        price: 26.99),
    Product_Item(
        id: 94,
        color: const Color(0xFFf39c12),
        name: 'Yellow Whatchamacallit',
        price: 19.99),
    Product_Item(
        id: 95,
        color: const Color(0xFF3498db),
        name: 'Blue Widget',
        price: 14.99),
    Product_Item(
        id: 96,
        color: const Color(0xFF2ecc71),
        name: 'Green Gadget',
        price: 23.99),
    Product_Item(
        id: 97,
        color: const Color(0xFFe74c3c),
        name: 'Red Gizmo',
        price: 17.99),
    Product_Item(
        id: 98,
        color: const Color(0xFFf39c12),
        name: 'Yellow Thingamajig',
        price: 25.99),
    Product_Item(
        id: 99,
        color: const Color(0xFF9b59b6),
        name: 'Purple Doohickey',
        price: 18.99),
    Product_Item(
        id: 100,
        color: const Color(0xFF34495e),
        name: 'Gray Contraption',
        price: 21.99),
  ];

  List listOfCartItem = [];

  void addToCart(Product_Item item) {
    listOfCartItem.add(item);

    item.isAdd = true;
    if (listOfCartItem.contains(item)) {
      emit(ItemIsAdd(item.name));
      Future.delayed(Duration(seconds: 1), () {
        item.isAdd = false;
        emit(ItemIsAdd(item.name));
      });
    }
  }

  void removeToCart(Product_Item item) {
    if (listOfCartItem.contains(item)) {
      listOfCartItem.remove(item);
      emit(ItemIsAdd(item.name));

    }
  }
}
