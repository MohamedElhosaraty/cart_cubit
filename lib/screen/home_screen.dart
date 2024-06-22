import 'package:cart_cubit/cubits/cart_cubit.dart';
import 'package:cart_cubit/screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return badges.Badge(
                badgeContent: Text(
                  context.watch<CartCubit>().listOfCartItem.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: -5, end: 4),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Cart_Screen(),));
                    }, icon: Icon(Icons.shopping_cart)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: context.watch<CartCubit>().productList.length,
          itemBuilder: (context, index) {
            final productItem = context.watch<CartCubit>().productList[index];
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
                context.read<CartCubit>().addToCart(productItem);
              }, child: productItem.isAdd ? Icon(Icons.check) : Text('Add')),
            );
          }),
    );
  }
}
