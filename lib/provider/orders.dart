import 'package:flutter/cupertino.dart';
import 'package:project1/provider/cart.dart';

class OrdersItem {
  final DateTime dateTime;
  final String id;
  final List<CartItem> orders;
  final double amount;

  OrdersItem(
      {required this.amount,
      required this.dateTime,
      required this.id,
      required this.orders});
}

class Orders with ChangeNotifier {
  final List<OrdersItem> _items = [];
  double totalOrdersAmount = 0.0;

  List<OrdersItem> get items {
    return [..._items];
  }

  double po = 0.0;
  void addOrder(final List<CartItem> orders, double total) {
    totalOrdersAmount += total;
    po = totalOrdersAmount / 100;
    _items.insert(
      0,
      OrdersItem(
          amount: total,
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          orders: orders),
    );
    notifyListeners();
  }

  void poo(double x) {
    if (po - x >= 0) {
      po -= x;
      notifyListeners();
    }
  }
}
