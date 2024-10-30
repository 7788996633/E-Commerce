import 'package:flutter/material.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/screen/cart_screen.dart';
import 'package:project1/screen/categories_screen.dart';
import 'package:project1/screen/favorite_products_screen.dart';
import 'package:project1/screen/homa_page_screen.dart';
import 'package:project1/widget/drawer.dart';
import 'package:provider/provider.dart';

import '../provider/colors.dart';
import '../provider/language.dart';
import '../widget/badge.dart';
import 'brands_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<MyColors>(context);
    final lang = Provider.of<Language>(context);
    final langList = lang.chosenWords;
    return Directionality(
      textDirection: lang.english ? TextDirection.ltr : TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: colors.backGroundColor,
          appBar: AppBar(
            backgroundColor: colors.appBarColor,
            elevation: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: const Icon(
                    Icons.home,
                  ),
                  text: langList[6],
                ),
                Tab(
                  icon: const Icon(
                    Icons.category,
                  ),
                  text: langList[7],
                ),
                Tab(
                  icon: const Icon(
                    Icons.branding_watermark,
                  ),
                  text: langList[8],
                ),
                Tab(
                  icon: const Icon(
                    Icons.favorite,
                  ),
                  text: langList[24],
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
          body: const TabBarView(
            children: [
              HomePageScreen(),
              CategoriesScreen(),
              BrandsScreen(),
              FavProductScreen(),
            ],
          ),
          drawer: const MyDrawer(),
        ),
      ),
    );
  }
}
