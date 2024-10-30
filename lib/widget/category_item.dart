import 'package:flutter/material.dart';
import 'package:project1/screen/products_screen.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Widget X;
  const CategoryItem(
      {super.key,
      required this.title,
      required this.image,
      required this.id,
      required this.X});

  @override
  Widget build(BuildContext context) {
    final productslist = Provider.of<Products>(context);
    final currentproducts = productslist.productsItems
        .where((element) => element.categoryTitle == title);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            currentproducts.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => X,
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductsScreen(
                        categoryTitle: title,
                      ),
                    ),
                  );
          },
          child: Image(
            image: AssetImage("assets/$image"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
