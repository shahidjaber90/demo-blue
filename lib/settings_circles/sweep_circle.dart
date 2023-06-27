import 'package:blueee/config.dart';
import 'package:blueee/variables/sweep_variable.dart';
import 'package:blueee/widgets/line_painter2.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {
  double botCircleX = 135;
  double botCircleY = 230;

  int x = 1;

  double vala = 0;
  double valb = 0;
  angle() {
    var angle = vala + valb;
    return angle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * angle();

    final paint = Paint()
      ..color = Colors.orange.shade200
      ..style = PaintingStyle.fill;

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(oldDelegate) =>
      angle != oldDelegate.angle || Colors.orange.shade200 != oldDelegate.color;

  void onTapDown(BuildContext context, TapDownDetails details) {
    visible = true;
    print('${details.globalPosition}');
    // final RenderObject? box = context.findRenderObject();
    // final Offset localOffset = box.globalToLocal(details.globalPosition);
    final RenderObject? box = context.findRenderObject();
    if (box is RenderBox) {
      print('box truee');
      Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        if (x == 1) {
          x = x + 1;
          print(x);
          posx = localOffset.dx;
          posy = localOffset.dy;

          variableS.angleA = posx.toStringAsFixed(0);
          variableS.angleb = posy.toStringAsFixed(0);
        } else if (x == 2) {
          x = x + 1;
          print('x greater :: $x');
          setState(() {
            secondLineVisible = true;
            tosx = localOffset.dx;
            tosy = localOffset.dy;

            variableS.angleA = tosx.toStringAsFixed(0);
            variableS.angleb = tosy.toStringAsFixed(0);
          });
        } else {
          return;
        }
      });
    } else {
      //print('box false');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    botCircleX = screenWidth / 2.2;
    botCircleY = screenHeight / 3.75;

    return GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: 
      Stack(fit: StackFit.expand, children: <Widget>[
        // Hack to expand stack to fill all the space. There must be a better
        // way to do it.

        Container(
          decoration: BoxDecoration(
            color: Colors.green.shade200,
            shape: BoxShape.circle,
          ),
        ),

        Visibility(
          visible: secondLineVisible,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Positioned(
              child: CustomPaint(painter: CircleGraphPainter(0.5, Colors.orange)
                  ),
            ),
          ),
        ),

        //  second line
        Visibility(
          visible: secondLineVisible,
          child: new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter2(
                  Offset(botCircleX + 10, botCircleY - 40),
                  Offset(tosx + 12.5, tosy + 11),
                  const Color(0xFF4CAF50)),
            ),
          ),
        ),
        new Positioned(
          child: new Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          top: 100,
          left: 130,
        ),
        Visibility(
          visible: secondLineVisible,
          child: new Positioned(
            child: GestureDetector(
              onPanUpdate: (details) {
                final RenderObject? box = context.findRenderObject();
                if (box is RenderBox) {
                  //print('box true');
                  Offset localOffset =
                      box.globalToLocal(details.globalPosition);
                  setState(() {
                    tosx = localOffset.dx;
                    tosy = localOffset.dy;
                    settingUpanglea(tosx);
                    settingUpangleb(tosy);
                  });
                }
              },
              child: new Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  border: Border.all(
                      width: 20, color: Color.fromARGB(255, 201, 41, 12)),
                  // color: Color.fromRGBO(98, 177, 226, 1.0)),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            left: tosx,
            top: tosy,
          ),
        ),
        Visibility(
          visible: visible,
          child: new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter2(
                  Offset(botCircleX + 10, botCircleY - 40), //+10
                  Offset(posx + 12.5, posy + 12),
                  const Color(0xFF4CAF50)),
            ),
          ),
        ),

        new Positioned(
          child: new Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          top: 100,
          left: 130,
        ),

        // throw line

        Visibility(
          visible: visible,
          child: new Positioned(
            child: GestureDetector(
              onPanUpdate: (details) {
                final RenderObject? box = context.findRenderObject();
                if (box is RenderBox) {
                  //print('box true');
                  Offset localOffset =
                      box.globalToLocal(details.globalPosition);
                  setState(() {
                    posx = localOffset.dx;
                    posy = localOffset.dy;
                    settingUpangleb(posy);
                    settingUpanglea(posx);
                  });
                }
              },
              child: new Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.green, //Color(0xFF2C5066),
                  border: Border.all(
                      width: 3,
                      color: const Color(0xFF4CAF50)), //Color(0xFF4CAF50)),
                  shape: BoxShape.circle,

                  //border: Border.all(width: 2, color: Colors.grey.shade600),
                ),
              ),
            ),
            left: posx,
            top: posy,
          ),
        ),
      ]),
    );
  }

  void settingUpanglea(double pixel) {
    if (pixel > 145) {
      vala = -50;
    } else if (pixel < 145 && pixel > 142) {
      vala = -50;
    } else if (pixel < 142 && pixel > 139) {
      vala = -48;
    } else if (pixel < 139 && pixel > 136) {
      vala = -46;
    } else if (pixel < 136 && pixel > 133) {
      vala = -44;
    } else if (pixel < 133 && pixel > 130) {
      vala = -42;
    } else if (pixel < 130 && pixel > 127) {
      vala = -40;
    } else if (pixel < 127 && pixel > 124) {
      vala = -38;
    } else if (pixel < 124 && pixel > 121) {
      vala = -36;
    } else if (pixel < 121 && pixel > 118) {
      vala = -34;
    } else if (pixel < 118 && pixel > 115) {
      vala = -32;
    } else if (pixel < 115 && pixel > 112) {
      vala = -30;
    } else if (pixel < 112 && pixel > 109) {
      vala = -28;
    } else if (pixel < 109 && pixel > 105) {
      vala = -26;
    } else if (pixel < 105 && pixel > 102) {
      vala = -24;
    } else if (pixel < 102 && pixel > 99) {
      vala = -22;
    } else if (pixel < 99 && pixel > 96) {
      vala = -20;
    } else if (pixel < 96 && pixel > 93) {
      vala = -18;
    } else if (pixel < 93 && pixel > 90) {
      vala = -16;
    } else if (pixel < 90 && pixel > 87) {
      vala = -14;
    } else if (pixel < 87 && pixel > 84) {
      vala = -12;
    } else if (pixel < 84 && pixel > 81) {
      vala = -10;
    } else if (pixel < 81 && pixel > 78) {
      vala = -8;
    } else if (pixel < 78 && pixel > 75) {
      vala = -6;
    } else if (pixel < 75 && pixel > 72) {
      vala = -4;
    } else if (pixel < 72 && pixel > 69) {
      vala = -2;
    } else if (pixel < 69 && pixel > 69) {
      // start value
      vala = 0;
    } else if (pixel < 69 && pixel > 66) {
      vala = 2;
    } else if (pixel < 66 && pixel > 63) {
      vala = 4;
    } else if (pixel < 63 && pixel > 60) {
      vala = 6;
    } else if (pixel < 60 && pixel > 57) {
      vala = 8;
    } else if (pixel < 57 && pixel > 54) {
      vala = 10;
    } else if (pixel < 54 && pixel > 51) {
      vala = 12;
    } else if (pixel < 51 && pixel > 48) {
      vala = 14;
    } else if (pixel < 48 && pixel > 45) {
      vala = 16;
    } else if (pixel < 45 && pixel > 42) {
      vala = 18;
    } else if (pixel < 42 && pixel > 39) {
      vala = 20;
    } else if (pixel < 39 && pixel > 36) {
      vala = 22;
    } else if (pixel < 36 && pixel > 33) {
      vala = 24;
    } else if (pixel < 33 && pixel > 29) {
      vala = 26;
    } else if (pixel < 29 && pixel > 26) {
      vala = 28;
    } else if (pixel < 26 && pixel > 23) {
      vala = 30;
    } else if (pixel < 23 && pixel > 20) {
      vala = 32;
    } else if (pixel < 20 && pixel > 17) {
      vala = 34;
    } else if (pixel < 17 && pixel > 14) {
      vala = 36;
    } else if (pixel < 14 && pixel > 11) {
      vala = 38;
    } else if (pixel < 11 && pixel > 8) {
      vala = 40;
    } else if (pixel < 8 && pixel > 5) {
      vala = 42;
    } else if (pixel < 5 && pixel > 2) {
      vala = 44;
    } else if (pixel < 2 && pixel > -1) {
      vala = 46;
    } else if (pixel < -1 && pixel > -4) {
      vala = 48;
    } else if (pixel < -4 && pixel > -6) {
      // bottom value
      vala = 50;
    } else if (pixel < -6) {
      vala = 50;
    } else {
      //vala = 100;
    }

    print('anglea :: $vala');

    variableS.angleA = vala.toStringAsFixed(0);
  }

  void settingUpangleb(double pixel) {
    print(pixel);

    if (pixel > 10 && pixel < 12) {
      valb = -100;
    } else if (pixel > 12 && pixel < 13) {
      valb = -99;
    } else if (pixel > 13 && pixel < 15) {
      valb = -98;
    } else if (pixel > 15 && pixel < 16) {
      valb = -97;
    } else if (pixel > 16 && pixel < 18) {
      valb = -96;
    } else if (pixel > 18 && pixel < 19) {
      valb = -95;
    } else if (pixel > 19 && pixel < 21) {
      valb = -94;
    } else if (pixel > 21 && pixel < 22) {
      valb = -93;
    } else if (pixel > 22 && pixel < 24) {
      valb = -92;
    } else if (pixel > 24 && pixel < 25) {
      valb = -91;
    } else if (pixel > 25 && pixel < 27) {
      valb = -90;
    } else if (pixel > 27 && pixel < 28) {
      valb = -89;
    } else if (pixel > 28 && pixel < 30) {
      valb = -88;
    } else if (pixel > 30 && pixel < 31) {
      valb = -87;
    } else if (pixel > 31 && pixel < 33) {
      valb = -86;
    } else if (pixel > 33 && pixel < 34) {
      valb = -85;
    } else if (pixel > 34 && pixel < 36) {
      valb = -84;
    } else if (pixel > 36 && pixel < 37) {
      valb = -83;
    } else if (pixel > 37 && pixel < 39) {
      valb = -82;
    } else if (pixel > 39 && pixel < 40) {
      valb = -81;
    } else if (pixel > 40 && pixel < 42) {
      valb = -80;
    } else if (pixel > 42 && pixel < 43) {
      valb = -79;
    } else if (pixel > 43 && pixel < 45) {
      valb = -78;
    } else if (pixel > 45 && pixel < 46) {
      valb = -77;
    } else if (pixel > 46 && pixel < 48) {
      valb = -76;
    } else if (pixel > 48 && pixel < 49) {
      valb = -75;
    } else if (pixel > 49 && pixel < 51) {
      valb = -74;
    } else if (pixel > 51 && pixel < 52) {
      valb = -73;
    } else if (pixel > 52 && pixel < 54) {
      valb = -72;
    } else if (pixel > 54 && pixel < 55) {
      valb = -71;
    } else if (pixel > 55 && pixel < 57) {
      valb = -70;
    } else if (pixel > 57 && pixel < 58) {
      valb = -69;
    } else if (pixel > 58 && pixel < 60) {
      valb = -68;
    } else if (pixel > 60 && pixel < 61) {
      valb = -67;
    } else if (pixel > 61 && pixel < 63) {
      valb = -66;
    } else if (pixel > 63 && pixel < 64) {
      valb = -65;
    } else if (pixel > 64 && pixel < 66) {
      valb = -64;
    } else if (pixel > 66 && pixel < 67) {
      valb = -63;
    } else if (pixel > 67 && pixel < 69) {
      valb = -62;
    } else if (pixel > 69 && pixel < 70) {
      valb = -61;
    } else if (pixel > 70 && pixel < 72) {
      valb = -60;
    } else if (pixel > 72 && pixel < 73) {
      valb = -59;
    } else if (pixel > 73 && pixel < 75) {
      valb = -58;
    } else if (pixel > 75 && pixel < 76) {
      valb = -57;
    } else if (pixel > 76 && pixel < 78) {
      valb = -56;
    } else if (pixel > 78 && pixel < 79) {
      valb = -55;
    } else if (pixel > 79 && pixel < 81) {
      valb = -54;
    } else if (pixel > 81 && pixel < 82) {
      valb = -53;
    } else if (pixel > 82 && pixel < 84) {
      valb = -52;
    } else if (pixel > 84 && pixel < 85) {
      valb = -51;
    } else if (pixel > 85 && pixel < 87) {
      valb = -50;
    } else if (pixel > 87 && pixel < 88) {
      valb = -49;
    } else if (pixel > 88 && pixel < 90) {
      valb = -48;
    } else if (pixel > 90 && pixel < 91) {
      valb = -47;
    } else if (pixel > 91 && pixel < 93) {
      valb = -46;
    } else if (pixel > 93 && pixel < 94) {
      valb = -45;
    } else if (pixel > 94 && pixel < 96) {
      valb = -44;
    } else if (pixel > 96 && pixel < 97) {
      valb = -43;
    } else if (pixel > 97 && pixel < 99) {
      valb = -42;
    } else if (pixel > 99 && pixel < 100) {
      valb = -41;
    } else if (pixel > 100 && pixel < 102) {
      valb = -40;
    } else if (pixel > 102 && pixel < 103) {
      valb = -39;
    } else if (pixel > 103 && pixel < 105) {
      valb = -38;
    } else if (pixel > 105 && pixel < 106) {
      valb = -37;
    } else if (pixel > 106 && pixel < 108) {
      valb = -36;
    } else if (pixel > 108 && pixel < 109) {
      valb = -35;
    } else if (pixel > 109 && pixel < 111) {
      valb = -34;
    } else if (pixel > 111 && pixel < 112) {
      valb = -33;
    } else if (pixel > 112 && pixel < 114) {
      valb = -32;
    } else if (pixel > 114 && pixel < 115) {
      valb = -31;
    } else if (pixel > 115 && pixel < 117) {
      valb = -30;
    } else if (pixel > 117 && pixel < 118) {
      valb = -29;
    } else if (pixel > 118 && pixel < 120) {
      valb = -28;
    } else if (pixel > 120 && pixel < 121) {
      valb = -27;
    } else if (pixel > 121 && pixel < 123) {
      valb = -26;
    } else if (pixel > 123 && pixel < 124) {
      valb = -25;
    } else if (pixel > 124 && pixel < 126) {
      valb = -24;
    } else if (pixel > 126 && pixel < 127) {
      valb = -23;
    } else if (pixel > 127 && pixel < 129) {
      valb = -22;
    } else if (pixel > 129 && pixel < 130) {
      valb = -21;
    } else if (pixel > 130 && pixel < 132) {
      valb = -20;
    } else if (pixel > 132 && pixel < 133) {
      valb = -19;
    } else if (pixel > 133 && pixel < 135) {
      valb = -18;
    } else if (pixel > 135 && pixel < 136) {
      valb = -17;
    } else if (pixel > 136 && pixel < 138) {
      valb = -16;
    } else if (pixel > 138 && pixel < 139) {
      valb = -15;
    } else if (pixel > 139 && pixel < 141) {
      valb = -14;
    } else if (pixel > 141 && pixel < 142) {
      valb = -13;
    } else if (pixel > 142 && pixel < 144) {
      valb = -12;
    } else if (pixel > 144 && pixel < 145) {
      valb = -11;
    } else if (pixel > 145 && pixel < 147) {
      valb = -10;
    } else if (pixel > 147 && pixel < 148) {
      valb = -9;
    } else if (pixel > 148 && pixel < 150) {
      valb = -8;
    } else if (pixel > 150 && pixel < 151) {
      valb = -7;
    } else if (pixel > 151 && pixel < 153) {
      valb = -6;
    } else if (pixel > 153 && pixel < 154) {
      valb = -5;
    } else if (pixel > 154 && pixel < 156) {
      valb = -4;
    } else if (pixel > 156 && pixel < 157) {
      valb = -3;
    } else if (pixel > 157 && pixel < 159) {
      valb = -2;
    } else if (pixel > 159 && pixel < 160) {
      valb = -1;
    } else if (pixel > 160 && pixel < 160) {
      valb = 0;
    } else if (pixel > 160 && pixel < 162) {
      valb = 1;
    } else if (pixel > 162 && pixel < 163) {
      valb = 2;
    } else if (pixel > 163 && pixel < 165) {
      valb = 3;
    } else if (pixel > 165 && pixel < 166) {
      valb = 4;
    } else if (pixel > 166 && pixel < 168) {
      valb = 5;
    } else if (pixel > 168 && pixel < 169) {
      valb = 6;
    } else if (pixel > 169 && pixel < 171) {
      valb = 7;
    } else if (pixel > 171 && pixel < 172) {
      valb = 8;
    } else if (pixel > 172 && pixel < 174) {
      valb = 9;
    } else if (pixel > 174 && pixel < 175) {
      valb = 10;
    } else if (pixel > 175 && pixel < 177) {
      valb = 11;
    } else if (pixel > 177 && pixel < 178) {
      valb = 12;
    } else if (pixel > 178 && pixel < 180) {
      valb = 13;
    } else if (pixel > 180 && pixel < 181) {
      valb = 14;
    } else if (pixel > 181 && pixel < 183) {
      valb = 15;
    } else if (pixel > 183 && pixel < 184) {
      valb = 16;
    } else if (pixel > 184 && pixel < 186) {
      valb = 17;
    } else if (pixel > 186 && pixel < 187) {
      valb = 18;
    } else if (pixel > 187 && pixel < 189) {
      valb = 19;
    } else if (pixel > 189 && pixel < 190) {
      valb = 20;
    } else if (pixel > 190 && pixel < 192) {
      valb = 21;
    } else if (pixel > 192 && pixel < 193) {
      valb = 22;
    } else if (pixel > 193 && pixel < 195) {
      valb = 23;
    } else if (pixel > 195 && pixel < 196) {
      valb = 24;
    } else if (pixel > 196 && pixel < 198) {
      valb = 25;
    } else if (pixel > 198 && pixel < 199) {
      valb = 26;
    } else if (pixel > 199 && pixel < 201) {
      valb = 27;
    } else if (pixel > 201 && pixel < 202) {
      valb = 28;
    } else if (pixel > 202 && pixel < 204) {
      valb = 29;
    } else if (pixel > 204 && pixel < 205) {
      valb = 30;
    } else if (pixel > 205 && pixel < 207) {
      valb = 31;
    } else if (pixel > 207 && pixel < 208) {
      valb = 32;
    } else if (pixel > 208 && pixel < 210) {
      valb = 33;
    } else if (pixel > 210 && pixel < 211) {
      valb = 34;
    } else if (pixel > 211 && pixel < 213) {
      valb = 35;
    } else if (pixel > 213 && pixel < 214) {
      valb = 36;
    } else if (pixel > 214 && pixel < 216) {
      valb = 37;
    } else if (pixel > 216 && pixel < 217) {
      valb = 38;
    } else if (pixel > 217 && pixel < 219) {
      valb = 39;
    } else if (pixel > 219 && pixel < 220) {
      valb = 40;
    } else if (pixel > 220 && pixel < 222) {
      valb = 41;
    } else if (pixel > 222 && pixel < 223) {
      valb = 42;
    } else if (pixel > 223 && pixel < 225) {
      valb = 43;
    } else if (pixel > 225 && pixel < 226) {
      valb = 44;
    } else if (pixel > 226 && pixel < 228) {
      valb = 45;
    } else if (pixel > 228 && pixel < 229) {
      valb = 46;
    } else if (pixel > 229 && pixel < 231) {
      valb = 47;
    } else if (pixel > 231 && pixel < 232) {
      valb = 48;
    } else if (pixel > 232 && pixel < 234) {
      valb = 49;
    } else if (pixel > 234 && pixel < 235) {
      valb = 50;
    } else if (pixel > 235 && pixel < 237) {
      valb = 51;
    } else if (pixel > 237 && pixel < 238) {
      valb = 52;
    } else if (pixel > 238 && pixel < 240) {
      valb = 53;
    } else if (pixel > 240 && pixel < 241) {
      valb = 54;
    } else if (pixel > 241 && pixel < 243) {
      valb = 55;
    } else if (pixel > 243 && pixel < 244) {
      valb = 56;
    } else if (pixel > 244 && pixel < 246) {
      valb = 57;
    } else if (pixel > 246 && pixel < 247) {
      valb = 58;
    } else if (pixel > 247 && pixel < 249) {
      valb = 59;
    } else if (pixel > 249 && pixel < 250) {
      valb = 60;
    } else if (pixel > 250 && pixel < 252) {
      valb = 61;
    } else if (pixel > 252 && pixel < 253) {
      valb = 62;
    } else if (pixel > 253 && pixel < 255) {
      valb = 63;
    } else if (pixel > 255 && pixel < 256) {
      valb = 64;
    } else if (pixel > 256 && pixel < 258) {
      valb = 65;
    } else if (pixel > 258 && pixel < 259) {
      valb = 66;
    } else if (pixel > 259 && pixel < 261) {
      valb = 67;
    } else if (pixel > 261 && pixel < 262) {
      valb = 68;
    } else if (pixel > 262 && pixel < 264) {
      valb = 69;
    } else if (pixel > 264 && pixel < 265) {
      valb = 70;
    } else if (pixel > 265 && pixel < 267) {
      valb = 71;
    } else if (pixel > 267 && pixel < 268) {
      valb = 72;
    } else if (pixel > 268 && pixel < 270) {
      valb = 73;
    } else if (pixel > 270 && pixel < 271) {
      valb = 74;
    } else if (pixel > 271 && pixel < 273) {
      valb = 75;
    } else if (pixel > 273 && pixel < 274) {
      valb = 76;
    } else if (pixel > 274 && pixel < 276) {
      valb = 77;
    } else if (pixel > 276 && pixel < 277) {
      valb = 78;
    } else if (pixel > 277 && pixel < 279) {
      valb = 79;
    } else if (pixel > 279 && pixel < 280) {
      valb = 80;
    } else if (pixel > 280 && pixel < 282) {
      valb = 81;
    } else if (pixel > 282 && pixel < 283) {
      valb = 82;
    } else if (pixel > 283 && pixel < 285) {
      valb = 83;
    } else if (pixel > 285 && pixel < 286) {
      valb = 84;
    } else if (pixel > 286 && pixel < 288) {
      valb = 85;
    } else if (pixel > 288 && pixel < 289) {
      valb = 86;
    } else if (pixel > 289 && pixel < 291) {
      valb = 87;
    } else if (pixel > 291 && pixel < 292) {
      valb = 88;
    } else if (pixel > 292 && pixel < 294) {
      valb = 89;
    } else if (pixel > 294 && pixel < 295) {
      valb = 90;
    } else if (pixel > 295 && pixel < 297) {
      valb = 91;
    } else if (pixel > 297 && pixel < 298) {
      valb = 92;
    } else if (pixel > 298 && pixel < 300) {
      valb = 93;
    } else if (pixel > 300 && pixel < 301) {
      valb = 94;
    } else if (pixel > 301 && pixel < 303) {
      valb = 95;
    } else if (pixel > 303 && pixel < 303) {
      valb = 96;
    } else if (pixel > 303 && pixel < 304) {
      valb = 97;
    } else if (pixel > 304 && pixel < 306) {
      valb = 98;
    } else if (pixel > 306 && pixel < 307) {
      valb = 99;
    } else if (pixel > 307 && pixel < 310) {
      valb = 100;
    } else {
      //valb = 0;
    }

    print('angleb :: $valb');
    variableS.angleb = valb.toStringAsFixed(0);
  }
}

//////////

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
