import 'package:flutter/material.dart';

typedef OnPositionChange(Offset offset);

class Slider2D extends StatelessWidget {
  final Offset offset;
  final OnPositionChange onChange;
  final Widget? thumbWidget;
  final double thumbSize;
  const Slider2D({
    Key? key,
    required this.offset,
    required this.onChange,
    this.thumbWidget,
    required this.thumbSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (conetxt, constraints) {
      return GestureDetector(
        onPanUpdate: (detais) {
          double x = detais.localPosition.dx;
          double y = detais.localPosition.dy;
          if (x < 0) x = 0;
          if (y < 0) y = 0;
          if (x > constraints.maxWidth) x = constraints.maxWidth;
          if (y > constraints.maxHeight) y = constraints.maxHeight;
          if (offset.dx != x || offset.dy != y) onChange(new Offset(x, y));
        },
        child: Container(
          child: Stack(
            children: [
              Container(),
              AnimatedPositioned(
                duration: Duration(milliseconds: 5),
                left: offset.dx - thumbSize / 2,
                top: offset.dy - thumbSize / 2,
                width: thumbSize,
                height: thumbSize,
                child: thumbWidget ??
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 3, color: Colors.black),
                          shape: BoxShape.circle),
                    ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
