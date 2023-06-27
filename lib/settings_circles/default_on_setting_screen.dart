import 'package:flutter/material.dart';

import '../widgets/line_painter.dart';

class DefaultLine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyWidgetState();
  }
}

class MyWidgetState extends State<DefaultLine> {
  double posx = 0;
  double posy = 0;

  double botCircleX = 95;
  double botCircleY = 180;

  double topCircleX = 95;
  double topCircleY = 20;

  bool visibility = false;

  void onTapDown(BuildContext context, TapDownDetails details) {
    visibility = true;
    print('${details.globalPosition}');
    // final RenderObject? box = context.findRenderObject();
    // final Offset localOffset = box.globalToLocal(details.globalPosition);
    final RenderObject? box = context.findRenderObject();
    if (box is RenderBox) {
      print('box true');
      Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        posx = localOffset.dx;
        posy = localOffset.dy;
      });
    } else {
      print('box false');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return new GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: Center(
        child: new Stack(fit: StackFit.expand, children: <Widget>[
          // Hack to expand stack to fill all the space. There must be a better
          // way to do it.
          new Container(
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
          ),
          new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter(
                  Offset(screenWidth / 4,
                      MediaQuery.of(context).size.width * 0.06),
                  Offset(screenWidth / 4, screenHeight / 4),
                  Color(0xff808080)),
            ),
          ),
          new Positioned(
            child: new Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                shape: BoxShape.circle,
              ),
            ),
            left: screenWidth / 4.35,
            top: screenHeight / 4,
          ),
          new Positioned(
            child: new Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                shape: BoxShape.circle,
              ),
            ),
            left: screenWidth / 4.35,
            top: screenHeight / 30,
          ),
        ]),
      ),
    );
  }
}
