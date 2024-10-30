import 'package:flutter/material.dart';
import 'package:project1/provider/cart.dart';
import 'package:project1/provider/product.dart';
import 'package:project1/provider/products.dart';
import 'package:project1/screen/product_datail_page.dart';
import 'package:provider/provider.dart';

class AddedProductItem extends StatelessWidget {
  const AddedProductItem({super.key, required this.poroductId});
  final String poroductId;
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context, listen: false).productsItems;
    final curreProduct =
        productList.firstWhere((element) => element.id == poroductId);
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductDetailPage(
                quantity: curreProduct.quantity,
                informations: curreProduct.informations,
                id: curreProduct.id,
                image: curreProduct.image,
                price: curreProduct.price,
                title: curreProduct.title),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: GridTile(
          footer: GridTileBar(
            subtitle: Text(
              "\$${curreProduct.price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black54,
            trailing: IconButton(
              onPressed: () {
                if (curreProduct.quantity > 1) {
                  cart.addItem(
                      curreProduct.id, curreProduct.title, curreProduct.price, curreProduct.image);
                }
              },
              icon: const Icon(Icons.shopping_cart_outlined,
                  color: Colors.white, size: 30),
            ),
            title: Text(
              curreProduct.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            leading: Consumer<Product>(
              builder: (ctx, value, child) => IconButton(
                onPressed: () {
                  value.changeFav();
                },
                icon: Icon(
                    value.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: value.isFavorite ? Colors.red : Colors.white,
                    size: 30),
              ),
            ),
          ),
          child: Image(
            height: 350,
            width: 220,
            fit: BoxFit.fill,
            image: NetworkImage(
              curreProduct.image,
            ),
          ),
        ),
      ),
    );
  }
}
