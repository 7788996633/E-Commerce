import 'package:flutter/material.dart';
import 'package:project1/provider/categories.dart';
import 'package:project1/screen/admin_products_by_category_screen.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class AdminSubCategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final Widget X;
  const AdminSubCategoriesItem(
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

    return GestureDetector(
      onTap: () {
        currentproducts.isEmpty
            ? Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => X,
                ),
              )
            : Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminProductsByCategoryScreen(
                    categoryTitle: title,
                  ),
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
                          Provider.of<Categories>(context, listen: false)
                              .removesubcategory(id);
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
            ],
          ),
        ),
      ),
    );
  }
}
