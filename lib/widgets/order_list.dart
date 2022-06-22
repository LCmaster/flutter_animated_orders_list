import 'package:flutter/material.dart';
import 'package:flutter_animated_orders_list/models/order.dart';
import 'package:flutter_animated_orders_list/widgets/order_entry.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          ...(orders.map((Order order) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: OrderEntry(order: order),
            );
          }).toList()),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
