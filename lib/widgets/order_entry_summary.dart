import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animated_orders_list/models/order.dart';

class OrderEntrySummary extends StatelessWidget {
  final Order order;
  final Random _random = Random();

  OrderEntrySummary({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${order.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Today\n${_random.nextInt(13).toString().padLeft(2, '0')}:${_random.nextInt(60).toString().padLeft(2, '0')} ${_random.nextBool() ? 'pm' : 'am'}'
                            .toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.trip_origin,
                                          color: Colors.grey.shade600,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            '${order.sendingFrom.number} ${order.sendingFrom.street}, ${order.sendingFrom.city}, ${order.sendingFrom.state}',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800,
                                            ),
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.grey.shade600,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.trip_origin,
                                          color: Colors.grey.shade600,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            '${order.sendingTo.number} ${order.sendingTo.street}, ${order.sendingTo.city}, ${order.sendingTo.state}',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade800,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping\n\$${order.shippingCost.toStringAsFixed(2)}'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey.shade500,
                                  ),
                                ),

                                Text(
                                  'Weight\n${order.product.weight} lbs'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
