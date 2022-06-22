import 'package:flutter/material.dart';
import 'package:flutter_animated_orders_list/models/order.dart';
import 'package:flutter_animated_orders_list/widgets/folding_widget.dart';
import 'package:flutter_animated_orders_list/widgets/order_entry_footer.dart';
import 'package:flutter_animated_orders_list/widgets/order_entry_header.dart';
import 'package:flutter_animated_orders_list/widgets/order_entry_section.dart';
import 'package:flutter_animated_orders_list/widgets/order_entry_summary.dart';

class OrderEntry extends StatefulWidget {
  final Order order;

  const OrderEntry({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderEntry> createState() => _OrderEntryState();
}

class _OrderEntryState extends State<OrderEntry>
    with SingleTickerProviderStateMixin {
  double height = 180;
  late final AnimationController _controller;
  final Duration duration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  Widget _senderSection() {
    return ListItemDetailsSectionRow(
      height: 75,
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 2.5, left: 10.0, right: 10.0),
      children: [
        OrderEntrySection(
          title: 'Sender',
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset('images/avatar.jpg', height: 45.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.order.sender.firstname} ${widget.order.sender.lastname}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            i < widget.order.sender.evaluation
                                ? Icons.star
                                : Icons.star_border,
                            color: i < widget.order.sender.evaluation
                                ? Colors.deepPurple
                                : Colors.black54,
                          )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _addressSection() {
    return ListItemDetailsSectionRow(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
      children: [
        OrderEntrySection(
          title: 'From',
          children: [
            Text(
              '${widget.order.sendingFrom.number} ${widget.order.sendingFrom.street}',
            ),
            Text(
              '${widget.order.sendingFrom.city}, ${widget.order.sendingFrom.state} ${widget.order.sendingFrom.zipCode}',
            ),
          ],
        ),
        OrderEntrySection(
          title: 'To',
          children: [
            Text(
              '${widget.order.sendingTo.number} ${widget.order.sendingTo.street}',
            ),
            Text(
              '${widget.order.sendingTo.city}, ${widget.order.sendingTo.state} ${widget.order.sendingTo.zipCode}',
            ),
          ],
        ),
      ],
    );
  }

  Widget _deliverySection() {
    return const ListItemDetailsSectionRow(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
      children: [
        OrderEntrySection(
          title: 'Delivery Date',
          children: [
            Text(
              '6:30 pm',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('July 10, 2022'),
          ],
        ),
        OrderEntrySection(
          title: 'Request Deadline',
          children: [
            Text(
              '24 minutes',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      child: FoldingWidget(
        _controller,
        const Interval(
          0.0,
          1 / 3,
          curve: Curves.easeInOut,
        ),
        width: double.infinity,
        height: 180,
        behind: OrderEntryHeader(
          height: 180,
          order: widget.order,
        ),
        front: OrderEntrySummary(
          order: widget.order,
        ),
        next: Column(
          children: [
            _senderSection(),
            FoldingWidget(
              _controller,
              const Interval(
                1 / 3,
                1 / 3 * 2,
                curve: Curves.easeInOut,
              ),
              width: double.infinity,
              height: 180,
              behind: _addressSection(),
              front: Container(
                height: 75,
                color: Colors.white,
              ),
              next: FoldingWidget(
                _controller,
                const Interval(
                  1 / 3 * 2,
                  1.0,
                  curve: Curves.easeInOut,
                ),
                width: double.infinity,
                height: 75,
                behind: _deliverySection(),
                front: Container(
                  height: 75,
                  color: Colors.white,
                ),
                next: const OrderEntryFooter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
