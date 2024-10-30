import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
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
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 420,
              width: 450,
              image: AssetImage("assets/$image"),
              fit: BoxFit.fill,
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const Divider(),
                    Text(
                      informations,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (quantity > 1) {
                              cart.addItem(id, title, price, image);
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              Text(
                                "Add to cart",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        // Consumer<Product>(
                        //   builder: (ctx, value, child) => MaterialButton(
                        //     onPressed: () {
                        //       value.changeFav();
                        //     },
                        //     child: Row(
                        //       children: [
                        //         Icon(
                        //             value.isFavorite
                        //                 ? Icons.favorite
                        //                 : Icons.favorite_border,
                        //             color: value.isFavorite
                        //                 ? Colors.red
                        //                 : Colors.black,
                        //             size: 30),
                        //         const Text(
                        //           "Add to favorite",
                        //           style: TextStyle(fontSize: 20),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
