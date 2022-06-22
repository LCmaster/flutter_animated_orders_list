import 'package:flutter_animated_orders_list/models/address.dart';
import 'package:flutter_animated_orders_list/models/product.dart';
import 'package:flutter_animated_orders_list/models/user.dart';

class Order {
  final String id;
  final User sender;
  final Product product;
  final double shippingCost;
  final Address sendingFrom;
  final Address sendingTo;

  Order({
    required this.id,
    required this.sender,
    required this.product,
    required this.shippingCost,
    required this.sendingFrom,
    required this.sendingTo,
  });
}
