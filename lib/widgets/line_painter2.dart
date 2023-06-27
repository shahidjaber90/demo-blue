import 'package:flutter/cupertino.dart';

class LinePainter2 extends CustomPainter{
  Offset lineX;
  Offset lineY;
  Color lineColor;

  LinePainter2(this.lineX, this.lineY, this.lineColor);
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2;

    canvas.drawLine(
        lineX,
        lineY,
        paint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}