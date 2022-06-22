import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_orders_list/models/address.dart';
import 'package:flutter_animated_orders_list/models/order.dart';
import 'package:flutter_animated_orders_list/models/product.dart';
import 'package:flutter_animated_orders_list/models/user.dart';
import 'package:flutter_animated_orders_list/widgets/order_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ordersList = [
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'John',
        lastname: 'Doe',
        evaluation: 3,
      ),
      product: Product(
        price: 59.99,
        image:
            'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 72,
      ),
      shippingCost: 30.0,
      sendingFrom: Address(
        street: 'Smoky Hollow Rd',
        number: 761,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11210,
      ),
      sendingTo: Address(
        street: 'Bohemia Ave',
        number: 46,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11237,
      ),
    ),
    //
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'John',
        lastname: 'Doe',
        evaluation: 3,
      ),
      product: Product(
        price: 59.99,
        image:
        'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 72,
      ),
      shippingCost: 30.0,
      sendingFrom: Address(
        street: 'Smoky Hollow Rd',
        number: 761,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11210,
      ),
      sendingTo: Address(
        street: 'Bohemia Ave',
        number: 46,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11237,
      ),
    ),
    //
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'John',
        lastname: 'Doe',
        evaluation: 3,
      ),
      product: Product(
        price: 59.99,
        image:
        'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 72,
      ),
      shippingCost: 30.0,
      sendingFrom: Address(
        street: 'Smoky Hollow Rd',
        number: 761,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11210,
      ),
      sendingTo: Address(
        street: 'Bohemia Ave',
        number: 46,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11237,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Folding Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        appBar: AppBar(
          title: const Text('Folding Orders List'),
        ),
        body: OrderList(orders: ordersList),
      ),
    );
  }
}
