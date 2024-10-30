import 'package:flutter/material.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/cart_screen.dart';
import 'package:project1/widget/search.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/language.dart';
import 'badge.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Language>(context);

    final colors = Provider.of<MyColors>(context);
    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: colors.backGroundColor,
        appBar: AppBar(
          backgroundColor: colors.appBarColor,
          title: IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(
                  Provider.of<Products>(context, listen: false),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
          elevation: 0,
          actions: [
            Consumer<Cart>(
              builder: (_, value, ch) => Badge1(
                value: value.itemCount.toString(),
                color: Colors.red,
                child: IconButton(
                  tooltip: "Show Your Cart",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        body: body,
      ),
    );
  }
}
