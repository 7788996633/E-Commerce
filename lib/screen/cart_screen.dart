import 'package:flutter/material.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/provider/orders.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/language.dart';
import '../widget/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orderss = Provider.of<Orders>(context, listen: false);
    final colors = Provider.of<MyColors>(context);
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colors.backGroundColor,
        appBar: AppBar(
          backgroundColor: colors.appBarColor,
          elevation: 0,
          title: Text(langList[12]),
          actions: [
            IconButton(
              tooltip: "Clear All",
              onPressed: () {
                cart.clearCart();
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(langList[13]),
                      Text("\$${cart.totalAmount.toStringAsFixed(2)}"),
                      MaterialButton(
                        onPressed: () {
                          if (cart.items.isNotEmpty) {
                            orderss.addOrder(
                                cart.items.values.toList(), cart.totalAmount);
                            cart.clearCart();
                          }
                        },
                        child: Text(langList[14]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemBuilder: (context, index) => CartItems(
                        productId: cart.items.keys.toList()[index],
                        id: cart.items.values.toList()[index].id,
                        title: cart.items.values.toList()[index].title,
                        quantity: cart.items.values.toList()[index].quantity,
                        price: cart.items.values.toList()[index].price),
                    itemCount: cart.items.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
