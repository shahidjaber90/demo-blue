import 'dart:math';
import 'package:flutter/material.dart';

class CircleGraphPage extends StatefulWidget {
  @override
  _CircleGraphPageState createState() => _CircleGraphPageState();
}

class _CircleGraphPageState extends State<CircleGraphPage> {
  double selectedAngle = 0.5; // Initial angle value (ranging from 0.0 to 1.0)
  Color selectedColor = Colors.blue; // Initial color value

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Graph'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: CircleGraphPainter(selectedAngle, selectedColor),
              ),
            ),
            SizedBox(height: 20),
            Slider(
              value: selectedAngle,
              min: 0.0,
              max: 1.0,
              onChanged: (newValue) {
                setState(() {
                  selectedAngle = newValue;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorButton(Colors.blue, changeColor),
                ColorButton(Colors.green, changeColor),
                ColorButton(Colors.red, changeColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleGraphPainter extends CustomPainter {
  final double angle;
  final Color color;

  CircleGraphPainter(this.angle, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * angle;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(CircleGraphPainter oldDelegate) =>
      angle != oldDelegate.angle || color != oldDelegate.color;
}

class ColorButton extends StatelessWidget {
  final Color color;
  final Function(Color) onTap;

  ColorButton(this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(color);
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}