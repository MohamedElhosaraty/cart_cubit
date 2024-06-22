import 'package:cart_cubit/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
          itemCount: context.watch<CartCubit>().listOfCartItem.length,
          itemBuilder: (context, index) {
            final productItem = context.watch<CartCubit>().listOfCartItem[index];
            return ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: productItem.color,
                    borderRadius: BorderRadius.circular(10)),
              ),
              title: Text(productItem.name),
              subtitle: Text(productItem.price.toString()),
              trailing: TextButton(onPressed: () {
                context.read<CartCubit>().removeToCart(productItem);
              }, child: Icon(Icons.delete),
              ));
          }),
    );
  }
}
