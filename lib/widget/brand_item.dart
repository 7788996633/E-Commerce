import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import '../screen/products_screen1.dart';

class BrandItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  const BrandItem({
    super.key,
    required this.title,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final productslist = Provider.of<Products>(context);
    final currentproducts = productslist.productsItems
        .where((element) => element.brandTitle == title);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: GridTile(
        footer: GridTileBar(
          leading: const Icon(Icons.add_alert_outlined),
          backgroundColor: Colors.black45,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            if (currentproducts.isNotEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductsScreen1(
                    brandTitle: title,
                  ),
                ),
              );
            }
          },
          child: Image(
            image: AssetImage("assets/$image"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
