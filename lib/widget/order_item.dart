import 'dart:math';

import 'package:flutter/material.dart';

import '../provider/orders.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.order});
  final OrdersItem order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.order.amount.toStringAsFixed(2)}"),
            subtitle: Text(
              DateTime.now().toString(),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(
                  () {
                    _expanded = !_expanded;
                  },
                );
              },
              icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              height: min(widget.order.orders.length * 20 + 70, 180),
              child: ListView(
                children: widget.order.orders
                    .map(
                      (e) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.title,
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                '${e.quantity}x \$${e.price}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
