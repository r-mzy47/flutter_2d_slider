import 'package:flutter/material.dart';

typedef OnPositionChange(double x, double y);

class Slider2D extends StatelessWidget {
  final double posx;
  final double posy;
  final OnPositionChange onChange;
  final Widget? thumbWidget;
  final double thumbSize;
  const Slider2D({
    Key? key,
    required this.posx,
    required this.posy,
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
          if (posx != x || posy != y) onChange(x, y);
        },
        child: Container(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 5),
                left: posx - thumbSize / 2,
                top: posy - thumbSize / 2,
                width: thumbSize,
                height: thumbSize,
                child: thumbWidget?? Container(
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
