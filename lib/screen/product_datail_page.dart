import 'package:flutter/material.dart';
import 'package:project1/screen/product_detail_screen.dart';
import 'package:project1/screen/review_screen.dart';
import 'package:project1/widget/search.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/colors.dart';
import '../provider/language.dart';
import '../provider/products.dart';
import '../widget/badge.dart';
import 'cart_screen.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.informations,
    required this.quantity,
  });
  final String id;
  final String title;
  final String image;
  final double price;
  final String informations;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);
    final lang = Provider.of<Language>(context);
    // final langList = lang.chosenWords;

    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: colors.backGroundColor,
          appBar: AppBar(
            backgroundColor: colors.appBarColor,
            title: IconButton(
              tooltip: "Search",
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.info,
                  ),
                  text: "Informations",
                ),
                Tab(
                  icon: Icon(
                    Icons.comment,
                  ),
                  text: "Reviews",
                ),
              ],
            ),
            actions: [
              Consumer<Cart>(
                builder: (context, value, child) => Badge1(
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
          body: TabBarView(
            children: [
              ProductDetailScreen(
                  quantity: quantity,
                  id: id,
                  title: title,
                  image: image,
                  price: price,
                  informations: informations),
              const ReviewScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
