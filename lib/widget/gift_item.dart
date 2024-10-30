import 'package:flutter/material.dart';
import 'package:project1/provider/product.dart';
import 'package:project1/screen/product_datail_page.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart';

class GiftItem extends StatefulWidget {
  const GiftItem({super.key});

  @override
  State<GiftItem> createState() => _GiftItemState();
}

class _GiftItemState extends State<GiftItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final orders = Provider.of<Orders>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ChangeNotifierProvider(
              create: (ctx) => product,
              child: ProductDetailPage(
                  quantity: 10,
                  informations: product.informations,
                  id: product.id,
                  image: product.image,
                  price: product.price,
                  title: product.title),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: GridTile(
          footer: GridTileBar(
            subtitle: Text(
              "\$${product.price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              onPressed: () {
                orders.poo(product.price);
              },
              icon: const Icon(Icons.redeem),
            ),
          ),
          child: Image(
            height: 350,
            width: 220,
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/${product.image}",
            ),
          ),
        ),
      ),
    );
  }
}
