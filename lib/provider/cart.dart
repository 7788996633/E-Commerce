import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.image,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String id, String title, double price, String image) {
    if (_items.containsKey(id)) {
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            image: image,
            quantity: 1,
            price: price),
      );
      notifyListeners();
    }
  }

  int get itemCount {
    return _items.isEmpty ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addQuantity(String id) {
    _items.update(
      id,
      (value) => CartItem(
          id: id,
          title: value.title,
          image: value.image,
          quantity: value.quantity + 1,
          price: value.price),
    );
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity > 1) {
      _items.update(
        id,
        (value) => CartItem(
            id: id,
            title: value.title,
            image: value.image,
            quantity: value.quantity - 1,
            price: value.price),
      );
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
