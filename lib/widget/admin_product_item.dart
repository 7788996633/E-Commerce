import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../screen/product_datail_page.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem(
      {super.key,
      required this.title,
      required this.image,
      required this.id,
      required this.price,
      required this.informations,
      required this.quantity});
  final String id;
  final String title;
  final String image;
  final String informations;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                quantity: quantity,
                informations: informations,
                id: id,
                image: image,
                price: price,
                title: title),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                  image: AssetImage(
                    'assets/$image',
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        elevation: 0,
                        color: Colors.blue,
                        onPressed: () {},
                        child: const Text("Edit"),
                      ),
                      MaterialButton(
                        elevation: 0,
                        color: Colors.red,
                        onPressed: () {
                          Provider.of<Products>(context, listen: false)
                              .removeProduct(id);
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Text("\$$price"),
            ],
          ),
        ),
      ),
    );
    // ListTile(
    //   title: Text(title),
    //   leading: CircleAvatar(
    //     backgroundImage: AssetImage("assets/$image"),
    //   ),
    //   trailing: SizedBox(
    //     width: 100,
    //     child: Row(
    //       children: [
    //         IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.edit),
    //         ),
    //         IconButton(
    //           onPressed: () {
    //             Provider.of<Products>(context, listen: false).removeProduct(id);
    //           },
    //           icon: const Icon(Icons.delete, color: Colors.red),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
