part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ItemIsAdd extends CartState {
  final String productName;

  bool isAdd = false;

  ItemIsAdd(this.productName);
}
