import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedFoldingWidget extends StatelessWidget {
  final Animation animation;
  final Widget? behind;
  final Widget? front;
  final Widget? next;

  const AnimatedFoldingWidget({
    Key? key,
    required this.animation,
    this.behind,
    this.front,
    this.next,
  }) : super(key: key);

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
                  visible: animation.value < 0.5,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(pi * animation.value),
                    alignment: FractionalOffset.bottomCenter,
                    child: front!,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: next != null && animation.value >= 0.5,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(pi + pi * animation.value),
                alignment: FractionalOffset.topCenter,
                child: next,
              ),
            ),
          ],
        );
      },
      animation: animation,
    );
  }
}
