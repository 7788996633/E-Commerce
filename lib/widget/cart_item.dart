import 'package:flutter/material.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/provider/products.dart';
import 'package:provider/provider.dart';

import '../provider/language.dart';

class CartItems extends StatelessWidget {
  const CartItems(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId});
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false).productsItems;
    var currentproduct = products.where(
      (element) => element.id == productId && element.quantity > 1,
    );
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;

    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(langList[15]),
            content: Text(langList[16]),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text(langList[18]),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text(langList[17]),
              ),
            ],
          ),
        );
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
        Provider.of<Products>(context, listen: false)
            .addQuantity(productId, quantity);
      },
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      child: Card(
        child: Column(
          children: [
            ListTile(
              trailing: Text("$quantity x"),
              title: Text(title),
              subtitle: Text("Total \$${price * quantity}"),
              leading: CircleAvatar(
                child: FittedBox(
                  child: Text("\$$price"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Cart>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      if (currentproduct.isNotEmpty) {
                        value.addQuantity(productId);
                        Provider.of<Products>(context, listen: false)
                            .removeQuantity(productId);
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                Consumer<Cart>(
                  builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value.removeSingleItem(productId);
                      Provider.of<Products>(context, listen: false)
                          .addSingleQuantity(productId);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
