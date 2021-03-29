import 'package:flutter/material.dart';

class DrawerCustomPainter extends CustomPainter {
  late double centerLoc;
  late double span;
  Color color;
  TextDirection textDirection;
  double width;
  bool isEndDrawer;

  DrawerCustomPainter(double startingPos, int itemsLength, this.color,
      this.textDirection, this.width, this.isEndDrawer) {
    //Determine % for each item
    final span = 1.0 / itemsLength;
    double l = startingPos + (span) / 2;
    centerLoc = l; // unit: %
    this.span = span - 0.4;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double bendHeight = span / 2;
    double bezierHeight = span / 2;

    double startOfBend = centerLoc - bendHeight / 2;
    double startOfBezier = startOfBend - bezierHeight;
    double endOfBend = centerLoc + bendHeight / 2;
    double endOfBezier = endOfBend + bezierHeight;

    double topControlPoint1 = startOfBend;
    double topControlPoint2 = startOfBend;
    double bottomControlPoint1 = endOfBend;
    double bottomControlPoint2 = endOfBend;

    // double centerLoc = loc;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square;

    final leftPath = Path()
      ..moveTo(width, 0)
      ..lineTo(width, (startOfBezier) * size.height)
      ..cubicTo(
        width,
        (topControlPoint1) * size.height,
        width * 0.70,
        topControlPoint2 * size.height,
        width * 0.700,
        (centerLoc) * size.height,
      )
      ..cubicTo(
        width * 0.70,
        bottomControlPoint1 * size.height,
        width,
        bottomControlPoint2 * size.height,
        width,
        endOfBezier * size.height,
      )
      ..lineTo(width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(leftPath, paint);

    canvas.drawCircle(Offset(width * 0.9, centerLoc * size.height), 5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
