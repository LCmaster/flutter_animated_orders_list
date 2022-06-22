import 'dart:math';

import 'package:flutter/material.dart';

class FoldingWidget extends StatelessWidget {
  final AnimationController controller;
  final Interval interval;

  final Color? color;
  final double width;
  final double height;
  final BoxDecoration? decoration;

  final Widget? behind;
  final Widget? front;
  final Widget? next;

  late final Animation<double> _animation;

  FoldingWidget(
    this.controller,
    this.interval, {
    Key? key,
    this.decoration,
    this.color = Colors.white,
    required this.width,
    required this.height,
    this.behind,
    this.front,
    this.next,
  }) : super(key: key) {
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: interval,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                behind!,
                Visibility(
                  visible: _animation.value < 0.5,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(pi * _animation.value),
                    alignment: FractionalOffset.bottomCenter,
                    child: front!,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: next != null && _animation.value >= 0.5,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(pi + pi * _animation.value),
                alignment: FractionalOffset.topCenter,
                child: next,
              ),
            ),
          ],
        );
      },
      animation: _animation,
    );
  }
}
