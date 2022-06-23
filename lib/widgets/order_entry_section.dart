import 'package:flutter/material.dart';

class OrderEntrySection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const OrderEntrySection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.shade500,
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}

class OrderEntrySectionRow extends StatelessWidget {
  final double height;
  final EdgeInsets padding;
  final List<Widget> children;

  const OrderEntrySectionRow({
    Key? key,
    required this.height,
    required this.children,
    this.padding = const EdgeInsets.all(10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: Padding(
        padding: padding,
        child: Row(
          children: children,
        ),
      ),
    );
  }
}