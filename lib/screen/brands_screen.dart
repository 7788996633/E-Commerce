import 'package:flutter/material.dart';
import 'package:project1/provider/brands.dart';
import 'package:project1/widget/brand_item.dart';
import 'package:provider/provider.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<Brands>(context);
    final brandsItems = brands.brandsItem;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
      child: brandsItems.isEmpty
          ? const Text("data")
          : GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: brandsItems.length,
              itemBuilder: (ctx, index) => BrandItem(
                  title: brandsItems[index].title,
                  image: brandsItems[index].image,
                  id: brandsItems[index].id),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.8,
                mainAxisSpacing: 20,
              ),
            ),
    );
  }
}
