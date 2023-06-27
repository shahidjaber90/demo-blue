import 'package:blueee/config.dart';
import 'package:blueee/widgets/line_painter2.dart';
import 'package:flutter/material.dart';

import '../widgets/line_painter.dart';

class PathCircle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyWidgetState();
  }
}

class MyWidgetState extends State<PathCircle> {
  double botCircleX = 135; //135
  double botCircleY = 230; //230

  double topCircleX = 135;
  double topCircleY = 20;

  int x = 1;

  double valx1 = 0;
  double valy1 = 0;
  double valx2 = 0;
  double valy2 = 0;

  void onTapDown(BuildContext context, TapDownDetails details) {
    visiblityPath = true;
    print('${details.globalPosition}');
    // final RenderObject? box = context.findRenderObject();
    // final Offset localOffset = box.globalToLocal(details.globalPosition);
    final RenderObject? box = context.findRenderObject();
    if (box is RenderBox) {
      print('box true');
      Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        if (x == 1) {
          x = x + 1;
          print(x);
          posxPath = localOffset.dx;
          posyPath = localOffset.dy;
        } else if (x == 2) {
          x = x + 1;
          print('x greater :: $x');
          setState(() {
            secondLineVisiblePath = true;
            tosxPath = localOffset.dx;
            tosyPath = localOffset.dy;
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
    botCircleX = screenWidth / 5.4; //2,2 grey dot - horisontal
    botCircleY = screenHeight / 5.6; //3 grey fot - vertical
    topCircleX = screenWidth / 1.4; //2,2 - orange dot - horisontal
    topCircleY = screenHeight / 5.6; //30 - orange dot vertical
    return new GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: new Stack(fit: StackFit.expand, children: <Widget>[
        // Hack to expand stack to fill all the space. There must be a better
        // way to do it.

        new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.deepOrange),
            shape: BoxShape.rectangle,
          ),
        ),

        Visibility(
          visible: visiblityPath,
          child: new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter2(
                  Offset(botCircleX + 10, botCircleY + 10),
                  Offset(posxPath + 12.5, posyPath + 12.5),
                  Color(0xFF2C5066)),
            ),
          ),
        ),

        Visibility(
          visible: secondLineVisiblePath,
          child: new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter2(
                  Offset(tosxPath + 12.5, tosyPath + 10),
                  Offset(topCircleX + 12.5, topCircleY + 11),
                  Color(0xFF2C5066)),
            ),
          ),
        ),

        Visibility(
          visible: secondLineVisiblePath,
          child: new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter(
                  Offset(posxPath + 12.5, posyPath + 12.5),
                  Offset(tosxPath + 12.5, tosyPath + 12.5),
                  Color(0xFF4CAF50)),
            ),
          ),
        ),

        new Positioned(
          child: CustomPaint(
            foregroundPainter: LinePainter(
                Offset(topCircleX + 10, topCircleY + 11), //right line point
                Offset(botCircleX + 10, botCircleY + 11),
                Color(0xff808080)), //left line point
          ),
        ),

        new Positioned(
          child: new Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              shape: BoxShape.circle,
            ),
          ),
          left: botCircleX,
          top: botCircleY,
        ),
        new Positioned(
          child: new Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              border: Border.all(width: 3, color: Colors.deepOrange),
              shape: BoxShape.circle,
            ),
          ),
          left: topCircleX,
          top: topCircleY,
        ),

        Visibility(
          visible: visiblityPath,
          child: new Positioned(
            child: GestureDetector(
              onPanUpdate: (details) {
                final RenderObject? box = context.findRenderObject();
                if (box is RenderBox) {
                  //print('box true');
                  Offset localOffset =
                      box.globalToLocal(details.globalPosition);
                  setState(() {
                    posxPath = localOffset.dx;
                    posyPath = localOffset.dy;
                    settingUpvalX1(posyPath);
                    settingUpvaly1(posxPath);
                  });
                }
              },
              child: new Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(width: 2, color: Colors.deepOrange),
                  color: Colors.green,
                ),
              ),
            ),
            left: posxPath,
            top: posyPath,
          ),
        ),

        Visibility(
          visible: secondLineVisiblePath,
          child: new Positioned(
            child: GestureDetector(
              onPanUpdate: (details) {
                final RenderObject? box = context.findRenderObject();
                if (box is RenderBox) {
                  //print('box true');
                  Offset localOffset =
                      box.globalToLocal(details.globalPosition);
                  setState(() {
                    tosxPath = localOffset.dx;
                    tosyPath = localOffset.dy;
                    settingUpvalx2(tosyPath);
                    settingUpvaly2(tosxPath);
                  });
                }
              },
              child: new Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(width: 2, color: Colors.deepOrange),
                    color: Colors.green),
              ),
            ),
            left: tosxPath,
            top: tosyPath,
          ),
        ),
      ]),
    );
  }

  void settingUpvaly1(double pixel) {
    if (pixel > 312) {
      valy1 = 100;
    } else if (pixel < 312 && pixel > 309) {
      valy1 = 99;
    } else if (pixel < 309 && pixel > 306) {
      valy1 = 98;
    } else if (pixel < 306 && pixel > 303) {
      valy1 = 97;
    } else if (pixel < 303 && pixel > 299) {
      valy1 = 96;
    } else if (pixel < 299 && pixel > 296) {
      valy1 = 95;
    } else if (pixel < 296 && pixel > 293) {
      valy1 = 94;
    } else if (pixel < 293 && pixel > 290) {
      valy1 = 93;
    } else if (pixel < 290 && pixel > 287) {
      valy1 = 92;
    } else if (pixel < 287 && pixel > 284) {
      valy1 = 91;
    } else if (pixel < 284 && pixel > 281) {
      valy1 = 90;
    } else if (pixel < 281 && pixel > 278) {
      valy1 = 89;
    } else if (pixel < 278 && pixel > 275) {
      valy1 = 88;
    } else if (pixel < 275 && pixel > 271) {
      valy1 = 87;
    } else if (pixel < 271 && pixel > 268) {
      valy1 = 86;
    } else if (pixel < 268 && pixel > 265) {
      valy1 = 85;
    } else if (pixel < 265 && pixel > 262) {
      valy1 = 84;
    } else if (pixel < 262 && pixel > 259) {
      valy1 = 83;
    } else if (pixel < 259 && pixel > 256) {
      valy1 = 82;
    } else if (pixel < 256 && pixel > 253) {
      valy1 = 81;
    } else if (pixel < 253 && pixel > 250) {
      valy1 = 80;
    } else if (pixel < 250 && pixel > 247) {
      valy1 = 79;
    } else if (pixel < 247 && pixel > 243) {
      valy1 = 78;
    } else if (pixel < 243 && pixel > 240) {
      valy1 = 77;
    } else if (pixel < 240 && pixel > 237) {
      valy1 = 76;
    } else if (pixel < 237 && pixel > 234) {
      valy1 = 75;
    } else if (pixel < 234 && pixel > 231) {
      valy1 = 74;
    } else if (pixel < 231 && pixel > 228) {
      valy1 = 73;
    } else if (pixel < 228 && pixel > 225) {
      valy1 = 72;
    } else if (pixel < 225 && pixel > 222) {
      valy1 = 71;
    } else if (pixel < 222 && pixel > 219) {
      valy1 = 70;
    } else if (pixel < 219 && pixel > 215) {
      valy1 = 69;
    } else if (pixel < 215 && pixel > 212) {
      valy1 = 68;
    } else if (pixel < 212 && pixel > 209) {
      valy1 = 67;
    } else if (pixel < 209 && pixel > 206) {
      valy1 = 66;
    } else if (pixel < 206 && pixel > 203) {
      valy1 = 65;
    } else if (pixel < 203 && pixel > 200) {
      valy1 = 64;
    } else if (pixel < 200 && pixel > 197) {
      valy1 = 63;
    } else if (pixel < 197 && pixel > 194) {
      valy1 = 62;
    } else if (pixel < 194 && pixel > 191) {
      valy1 = 61;
    } else if (pixel < 191 && pixel > 187) {
      valy1 = 60;
    } else if (pixel < 187 && pixel > 184) {
      valy1 = 59;
    } else if (pixel < 184 && pixel > 181) {
      valy1 = 58;
    } else if (pixel < 181 && pixel > 178) {
      valy1 = 57;
    } else if (pixel < 178 && pixel > 175) {
      valy1 = 56;
    } else if (pixel < 175 && pixel > 172) {
      valy1 = 55;
    } else if (pixel < 172 && pixel > 169) {
      valy1 = 54;
    } else if (pixel < 169 && pixel > 166) {
      valy1 = 53;
    } else if (pixel < 166 && pixel > 163) {
      valy1 = 52;
    } else if (pixel < 163 && pixel > 160) {
      valy1 = 51;
    } else if (pixel < 160 && pixel > 156) {
      valy1 = 50;
    } else if (pixel < 156 && pixel > 153) {
      valy1 = 49;
    } else if (pixel < 153 && pixel > 150) {
      valy1 = 48;
    } else if (pixel < 150 && pixel > 147) {
      valy1 = 47;
    } else if (pixel < 147 && pixel > 144) {
      valy1 = 46;
    } else if (pixel < 144 && pixel > 141) {
      valy1 = 45;
    } else if (pixel < 141 && pixel > 138) {
      valy1 = 44;
    } else if (pixel < 138 && pixel > 135) {
      valy1 = 43;
    } else if (pixel < 135 && pixel > 132) {
      valy1 = 42;
    } else if (pixel < 132 && pixel > 128) {
      valy1 = 41;
    } else if (pixel < 128 && pixel > 125) {
      valy1 = 40;
    } else if (pixel < 125 && pixel > 122) {
      valy1 = 39;
    } else if (pixel < 122 && pixel > 119) {
      valy1 = 38;
    } else if (pixel < 119 && pixel > 116) {
      valy1 = 37;
    } else if (pixel < 116 && pixel > 113) {
      valy1 = 36;
    } else if (pixel < 113 && pixel > 110) {
      valy1 = 35;
    } else if (pixel < 110 && pixel > 107) {
      valy1 = 34;
    } else if (pixel < 107 && pixel > 104) {
      valy1 = 33;
    } else if (pixel < 104 && pixel > 100) {
      valy1 = 32;
    } else if (pixel < 100 && pixel > 97) {
      valy1 = 31;
    } else if (pixel < 97 && pixel > 94) {
      valy1 = 30;
    } else if (pixel < 94 && pixel > 91) {
      valy1 = 29;
    } else if (pixel < 91 && pixel > 88) {
      valy1 = 28;
    } else if (pixel < 88 && pixel > 85) {
      valy1 = 27;
    } else if (pixel < 85 && pixel > 82) {
      valy1 = 26;
    } else if (pixel < 82 && pixel > 79) {
      valy1 = 25;
    } else if (pixel < 79 && pixel > 76) {
      valy1 = 24;
    } else if (pixel < 76 && pixel > 72) {
      valy1 = 23;
    } else if (pixel < 72 && pixel > 69) {
      valy1 = 22;
    } else if (pixel < 69 && pixel > 66) {
      valy1 = 21;
    } else if (pixel < 66 && pixel > 63) {
      valy1 = 20;
    } else if (pixel < 63 && pixel > 60) {
      valy1 = 19;
    } else if (pixel < 60 && pixel > 57) {
      valy1 = 18;
    } else if (pixel < 57 && pixel > 54) {
      valy1 = 17;
    } else if (pixel < 54 && pixel > 51) {
      valy1 = 16;
    } else if (pixel < 51 && pixel > 48) {
      valy1 = 15;
    } else if (pixel < 48 && pixel > 44) {
      valy1 = 14;
    } else if (pixel < 44 && pixel > 41) {
      valy1 = 13;
    } else if (pixel < 41 && pixel > 38) {
      valy1 = 12;
    } else if (pixel < 38 && pixel > 35) {
      valy1 = 11;
    } else if (pixel < 35 && pixel > 32) {
      valy1 = 10;
    } else if (pixel < 32 && pixel > 29) {
      valy1 = 9;
    } else if (pixel < 29 && pixel > 26) {
      valy1 = 8;
    } else if (pixel < 26 && pixel > 23) {
      valy1 = 7;
    } else if (pixel < 23 && pixel > 20) {
      valy1 = 6;
    } else if (pixel < 20 && pixel > 16) {
      valy1 = 5;
    } else if (pixel < 16 && pixel > 13) {
      valy1 = 4;
    } else if (pixel < 13 && pixel > 10) {
      valy1 = 3;
    } else if (pixel < 10 && pixel > 7) {
      valy1 = 2;
    } else if (pixel < 7 && pixel > 4) {
      valy1 = 1;
    } else if (pixel < 4 && pixel > 0) {
      valy1 = 0;
    } else if (pixel < 0) {
      valy1 = 0;
    } else {
      //objectValY = 0;
    }

    //('y1 :: $valy1');
    varibleP.y1 = valy1.toStringAsFixed(0);
  }

  void settingUpvalX1(double pixel) {
    //(pixel);

    if (pixel < 3) {
      valx1 = -50;
    } else if (pixel > 3 && pixel < 5) {
      valx1 = -49;
    } else if (pixel > 5 && pixel < 8) {
      valx1 = -48;
    } else if (pixel > 8 && pixel < 10) {
      valx1 = -47;
    } else if (pixel > 10 && pixel < 12) {
      valx1 = -46;
    } else if (pixel > 12 && pixel < 14) {
      valx1 = -45;
    } else if (pixel > 14 && pixel < 17) {
      valx1 = -44;
    } else if (pixel > 17 && pixel < 19) {
      valx1 = -43;
    } else if (pixel > 19 && pixel < 21) {
      valx1 = -42;
    } else if (pixel > 21 && pixel < 23) {
      valx1 = -41;
    } else if (pixel > 23 && pixel < 26) {
      valx1 = -40;
    } else if (pixel > 26 && pixel < 28) {
      valx1 = -39;
    } else if (pixel > 28 && pixel < 30) {
      valx1 = -38;
    } else if (pixel > 30 && pixel < 32) {
      valx1 = -37;
    } else if (pixel > 32 && pixel < 35) {
      valx1 = -36;
    } else if (pixel > 35 && pixel < 37) {
      valx1 = -35;
    } else if (pixel > 37 && pixel < 39) {
      valx1 = -34;
    } else if (pixel > 39 && pixel < 41) {
      valx1 = -33;
    } else if (pixel > 41 && pixel < 44) {
      valx1 = -32;
    } else if (pixel > 44 && pixel < 46) {
      valx1 = -31;
    } else if (pixel > 46 && pixel < 48) {
      valx1 = -30;
    } else if (pixel > 48 && pixel < 50) {
      valx1 = -29;
    } else if (pixel > 50 && pixel < 53) {
      valx1 = -28;
    } else if (pixel > 53 && pixel < 55) {
      valx1 = -27;
    } else if (pixel > 55 && pixel < 57) {
      valx1 = -26;
    } else if (pixel > 57 && pixel < 59) {
      valx1 = -25;
    } else if (pixel > 59 && pixel < 62) {
      valx1 = -24;
    } else if (pixel > 62 && pixel < 64) {
      valx1 = -23;
    } else if (pixel > 64 && pixel < 66) {
      valx1 = -22;
    } else if (pixel > 66 && pixel < 68) {
      valx1 = -21;
    } else if (pixel > 68 && pixel < 71) {
      valx1 = -20;
    } else if (pixel > 71 && pixel < 73) {
      valx1 = -19;
    } else if (pixel > 73 && pixel < 75) {
      valx1 = -18;
    } else if (pixel > 75 && pixel < 77) {
      valx1 = -17;
    } else if (pixel > 77 && pixel < 80) {
      valx1 = -16;
    } else if (pixel > 80 && pixel < 82) {
      valx1 = -15;
    } else if (pixel > 82 && pixel < 84) {
      valx1 = -14;
    } else if (pixel > 84 && pixel < 86) {
      valx1 = -13;
    } else if (pixel > 86 && pixel < 89) {
      valx1 = -12;
    } else if (pixel > 89 && pixel < 91) {
      valx1 = -11;
    } else if (pixel > 91 && pixel < 93) {
      valx1 = -10;
    } else if (pixel > 93 && pixel < 95) {
      valx1 = -9;
    } else if (pixel > 95 && pixel < 98) {
      valx1 = -8;
    } else if (pixel > 98 && pixel < 100) {
      valx1 = -7;
    } else if (pixel > 100 && pixel < 102) {
      valx1 = -6;
    } else if (pixel > 102 && pixel < 104) {
      valx1 = -5;
    } else if (pixel > 104 && pixel < 107) {
      valx1 = -4;
    } else if (pixel > 107 && pixel < 109) {
      valx1 = -3;
    } else if (pixel > 109 && pixel < 111) {
      valx1 = -2;
    } else if (pixel > 111 && pixel < 113) {
      valx1 = -1;
    } else if (pixel > 113 && pixel < 116) {
      valx1 = -0;
    } else if (pixel > 116 && pixel < 118) {
      valx1 = 1;
    } else if (pixel > 118 && pixel < 120) {
      valx1 = 2;
    } else if (pixel > 120 && pixel < 122) {
      valx1 = 3;
    } else if (pixel > 122 && pixel < 125) {
      valx1 = 4;
    } else if (pixel > 125 && pixel < 127) {
      valx1 = 5;
    } else if (pixel > 127 && pixel < 129) {
      valx1 = 6;
    } else if (pixel > 129 && pixel < 131) {
      valx1 = 7;
    } else if (pixel > 131 && pixel < 134) {
      valx1 = 8;
    } else if (pixel > 134 && pixel < 136) {
      valx1 = 9;
    } else if (pixel > 136 && pixel < 138) {
      valx1 = 10;
    } else if (pixel > 138 && pixel < 140) {
      valx1 = 11;
    } else if (pixel > 140 && pixel < 143) {
      valx1 = 12;
    } else if (pixel > 143 && pixel < 145) {
      valx1 = 13;
    } else if (pixel > 145 && pixel < 147) {
      valx1 = 14;
    } else if (pixel > 147 && pixel < 149) {
      valx1 = 15;
    } else if (pixel > 149 && pixel < 152) {
      valx1 = 16;
    } else if (pixel > 152 && pixel < 154) {
      valx1 = 17;
    } else if (pixel > 154 && pixel < 156) {
      valx1 = 18;
    } else if (pixel > 156 && pixel < 158) {
      valx1 = 19;
    } else if (pixel > 158 && pixel < 161) {
      valx1 = 20;
    } else if (pixel > 161 && pixel < 163) {
      valx1 = 21;
    } else if (pixel > 163 && pixel < 165) {
      valx1 = 22;
    } else if (pixel > 165 && pixel < 167) {
      valx1 = 23;
    } else if (pixel > 167 && pixel < 170) {
      valx1 = 24;
    } else if (pixel > 170 && pixel < 172) {
      valx1 = 25;
    } else if (pixel > 172 && pixel < 174) {
      valx1 = 26;
    } else if (pixel > 174 && pixel < 176) {
      valx1 = 27;
    } else if (pixel > 176 && pixel < 179) {
      valx1 = 28;
    } else if (pixel > 179 && pixel < 181) {
      valx1 = 29;
    } else if (pixel > 181 && pixel < 183) {
      valx1 = 30;
    } else if (pixel > 183 && pixel < 185) {
      valx1 = 31;
    } else if (pixel > 185 && pixel < 188) {
      valx1 = 32;
    } else if (pixel > 188 && pixel < 190) {
      valx1 = 33;
    } else if (pixel > 190 && pixel < 192) {
      valx1 = 34;
    } else if (pixel > 192 && pixel < 194) {
      valx1 = 35;
    } else if (pixel > 194 && pixel < 197) {
      valx1 = 36;
    } else if (pixel > 197 && pixel < 199) {
      valx1 = 37;
    } else if (pixel > 199 && pixel < 201) {
      valx1 = 38;
    } else if (pixel > 201 && pixel < 203) {
      valx1 = 39;
    } else if (pixel > 203 && pixel < 206) {
      valx1 = 40;
    } else if (pixel > 206 && pixel < 208) {
      valx1 = 41;
    } else if (pixel > 208 && pixel < 210) {
      valx1 = 42;
    } else if (pixel > 210 && pixel < 212) {
      valx1 = 43;
    } else if (pixel > 212 && pixel < 215) {
      valx1 = 44;
    } else if (pixel > 215 && pixel < 217) {
      valx1 = 45;
    } else if (pixel > 217 && pixel < 219) {
      valx1 = 46;
    } else if (pixel > 219 && pixel < 221) {
      valx1 = 47;
    } else if (pixel > 221 && pixel < 224) {
      valx1 = 48;
    } else if (pixel > 224 && pixel < 226) {
      valx1 = 49;
    } else if (pixel > 226 && pixel < 228) {
      valx1 = 50;
    } else if (pixel > 228 && pixel < 310) {
      valx1 = 50;
    } else {
      //valx1 = 0;
    }

    //print('x1 :: $valx1');

    print('Pixel :: $pixel' +
        '     ' +
        'y1 :: $valy1' +
        '      ' +
        'x1 :: $valx1');

    varibleP.x1 = valx1.toStringAsFixed(0);
  }

  void settingUpvaly2(double pixel) {
    if (pixel > 312) {
      valy2 = 100;
    } else if (pixel < 312 && pixel > 309) {
      valy2 = 99;
    } else if (pixel < 309 && pixel > 306) {
      valy2 = 98;
    } else if (pixel < 306 && pixel > 303) {
      valy2 = 97;
    } else if (pixel < 303 && pixel > 299) {
      valy2 = 96;
    } else if (pixel < 299 && pixel > 296) {
      valy2 = 95;
    } else if (pixel < 296 && pixel > 293) {
      valy2 = 94;
    } else if (pixel < 293 && pixel > 290) {
      valy2 = 93;
    } else if (pixel < 290 && pixel > 287) {
      valy2 = 92;
    } else if (pixel < 287 && pixel > 284) {
      valy2 = 91;
    } else if (pixel < 284 && pixel > 281) {
      valy2 = 90;
    } else if (pixel < 281 && pixel > 278) {
      valy2 = 89;
    } else if (pixel < 278 && pixel > 275) {
      valy2 = 88;
    } else if (pixel < 275 && pixel > 271) {
      valy2 = 87;
    } else if (pixel < 271 && pixel > 268) {
      valy2 = 86;
    } else if (pixel < 268 && pixel > 265) {
      valy2 = 85;
    } else if (pixel < 265 && pixel > 262) {
      valy2 = 84;
    } else if (pixel < 262 && pixel > 259) {
      valy2 = 83;
    } else if (pixel < 259 && pixel > 256) {
      valy2 = 82;
    } else if (pixel < 256 && pixel > 253) {
      valy2 = 81;
    } else if (pixel < 253 && pixel > 250) {
      valy2 = 80;
    } else if (pixel < 250 && pixel > 247) {
      valy2 = 79;
    } else if (pixel < 247 && pixel > 243) {
      valy2 = 78;
    } else if (pixel < 243 && pixel > 240) {
      valy2 = 77;
    } else if (pixel < 240 && pixel > 237) {
      valy2 = 76;
    } else if (pixel < 237 && pixel > 234) {
      valy2 = 75;
    } else if (pixel < 234 && pixel > 231) {
      valy2 = 74;
    } else if (pixel < 231 && pixel > 228) {
      valy2 = 73;
    } else if (pixel < 228 && pixel > 225) {
      valy2 = 72;
    } else if (pixel < 225 && pixel > 222) {
      valy2 = 71;
    } else if (pixel < 222 && pixel > 219) {
      valy2 = 70;
    } else if (pixel < 219 && pixel > 215) {
      valy2 = 69;
    } else if (pixel < 215 && pixel > 212) {
      valy2 = 68;
    } else if (pixel < 212 && pixel > 209) {
      valy2 = 67;
    } else if (pixel < 209 && pixel > 206) {
      valy2 = 66;
    } else if (pixel < 206 && pixel > 203) {
      valy2 = 65;
    } else if (pixel < 203 && pixel > 200) {
      valy2 = 64;
    } else if (pixel < 200 && pixel > 197) {
      valy2 = 63;
    } else if (pixel < 197 && pixel > 194) {
      valy2 = 62;
    } else if (pixel < 194 && pixel > 191) {
      valy2 = 61;
    } else if (pixel < 191 && pixel > 187) {
      valy2 = 60;
    } else if (pixel < 187 && pixel > 184) {
      valy2 = 59;
    } else if (pixel < 184 && pixel > 181) {
      valy2 = 58;
    } else if (pixel < 181 && pixel > 178) {
      valy2 = 57;
    } else if (pixel < 178 && pixel > 175) {
      valy2 = 56;
    } else if (pixel < 175 && pixel > 172) {
      valy2 = 55;
    } else if (pixel < 172 && pixel > 169) {
      valy2 = 54;
    } else if (pixel < 169 && pixel > 166) {
      valy2 = 53;
    } else if (pixel < 166 && pixel > 163) {
      valy2 = 52;
    } else if (pixel < 163 && pixel > 160) {
      valy2 = 51;
    } else if (pixel < 160 && pixel > 156) {
      valy2 = 50;
    } else if (pixel < 156 && pixel > 153) {
      valy2 = 49;
    } else if (pixel < 153 && pixel > 150) {
      valy2 = 48;
    } else if (pixel < 150 && pixel > 147) {
      valy2 = 47;
    } else if (pixel < 147 && pixel > 144) {
      valy2 = 46;
    } else if (pixel < 144 && pixel > 141) {
      valy2 = 45;
    } else if (pixel < 141 && pixel > 138) {
      valy2 = 44;
    } else if (pixel < 138 && pixel > 135) {
      valy2 = 43;
    } else if (pixel < 135 && pixel > 132) {
      valy2 = 42;
    } else if (pixel < 132 && pixel > 128) {
      valy2 = 41;
    } else if (pixel < 128 && pixel > 125) {
      valy2 = 40;
    } else if (pixel < 125 && pixel > 122) {
      valy2 = 39;
    } else if (pixel < 122 && pixel > 119) {
      valy2 = 38;
    } else if (pixel < 119 && pixel > 116) {
      valy2 = 37;
    } else if (pixel < 116 && pixel > 113) {
      valy2 = 36;
    } else if (pixel < 113 && pixel > 110) {
      valy2 = 35;
    } else if (pixel < 110 && pixel > 107) {
      valy2 = 34;
    } else if (pixel < 107 && pixel > 104) {
      valy2 = 33;
    } else if (pixel < 104 && pixel > 100) {
      valy2 = 32;
    } else if (pixel < 100 && pixel > 97) {
      valy2 = 31;
    } else if (pixel < 97 && pixel > 94) {
      valy2 = 30;
    } else if (pixel < 94 && pixel > 91) {
      valy2 = 29;
    } else if (pixel < 91 && pixel > 88) {
      valy2 = 28;
    } else if (pixel < 88 && pixel > 85) {
      valy2 = 27;
    } else if (pixel < 85 && pixel > 82) {
      valy2 = 26;
    } else if (pixel < 82 && pixel > 79) {
      valy2 = 25;
    } else if (pixel < 79 && pixel > 76) {
      valy2 = 24;
    } else if (pixel < 76 && pixel > 72) {
      valy2 = 23;
    } else if (pixel < 72 && pixel > 69) {
      valy2 = 22;
    } else if (pixel < 69 && pixel > 66) {
      valy2 = 21;
    } else if (pixel < 66 && pixel > 63) {
      valy2 = 20;
    } else if (pixel < 63 && pixel > 60) {
      valy2 = 19;
    } else if (pixel < 60 && pixel > 57) {
      valy2 = 18;
    } else if (pixel < 57 && pixel > 54) {
      valy2 = 17;
    } else if (pixel < 54 && pixel > 51) {
      valy2 = 16;
    } else if (pixel < 51 && pixel > 48) {
      valy2 = 15;
    } else if (pixel < 48 && pixel > 44) {
      valy2 = 14;
    } else if (pixel < 44 && pixel > 41) {
      valy2 = 13;
    } else if (pixel < 41 && pixel > 38) {
      valy2 = 12;
    } else if (pixel < 38 && pixel > 35) {
      valy2 = 11;
    } else if (pixel < 35 && pixel > 32) {
      valy2 = 10;
    } else if (pixel < 32 && pixel > 29) {
      valy2 = 9;
    } else if (pixel < 29 && pixel > 26) {
      valy2 = 8;
    } else if (pixel < 26 && pixel > 23) {
      valy2 = 7;
    } else if (pixel < 23 && pixel > 20) {
      valy2 = 6;
    } else if (pixel < 20 && pixel > 16) {
      valy2 = 5;
    } else if (pixel < 16 && pixel > 13) {
      valy2 = 4;
    } else if (pixel < 13 && pixel > 10) {
      valy2 = 3;
    } else if (pixel < 10 && pixel > 7) {
      valy2 = 2;
    } else if (pixel < 7 && pixel > 4) {
      valy2 = 1;
    } else if (pixel < 4 && pixel > 0) {
      valy2 = 0;
    } else if (pixel < 0) {
      valy2 = 0;
    } else {
      //valy2 = 0;
    }

    //print('y2 :: $valy2');
    varibleP.y2 = valy2.toStringAsFixed(0);
  }

  void settingUpvalx2(double pixel) {
    //print(pixel);

    if (pixel < 3) {
      valx2 = -50;
    } else if (pixel > 3 && pixel < 5) {
      valx2 = -49;
    } else if (pixel > 5 && pixel < 8) {
      valx2 = -48;
    } else if (pixel > 8 && pixel < 10) {
      valx2 = -47;
    } else if (pixel > 10 && pixel < 12) {
      valx2 = -46;
    } else if (pixel > 12 && pixel < 14) {
      valx2 = -45;
    } else if (pixel > 14 && pixel < 17) {
      valx2 = -44;
    } else if (pixel > 17 && pixel < 19) {
      valx2 = -43;
    } else if (pixel > 19 && pixel < 21) {
      valx2 = -42;
    } else if (pixel > 21 && pixel < 23) {
      valx2 = -41;
    } else if (pixel > 23 && pixel < 26) {
      valx2 = -40;
    } else if (pixel > 26 && pixel < 28) {
      valx2 = -39;
    } else if (pixel > 28 && pixel < 30) {
      valx2 = -38;
    } else if (pixel > 30 && pixel < 32) {
      valx2 = -37;
    } else if (pixel > 32 && pixel < 35) {
      valx2 = -36;
    } else if (pixel > 35 && pixel < 37) {
      valx2 = -35;
    } else if (pixel > 37 && pixel < 39) {
      valx2 = -34;
    } else if (pixel > 39 && pixel < 41) {
      valx2 = -33;
    } else if (pixel > 41 && pixel < 44) {
      valx2 = -32;
    } else if (pixel > 44 && pixel < 46) {
      valx2 = -31;
    } else if (pixel > 46 && pixel < 48) {
      valx2 = -30;
    } else if (pixel > 48 && pixel < 50) {
      valx2 = -29;
    } else if (pixel > 50 && pixel < 53) {
      valx2 = -28;
    } else if (pixel > 53 && pixel < 55) {
      valx2 = -27;
    } else if (pixel > 55 && pixel < 57) {
      valx2 = -26;
    } else if (pixel > 57 && pixel < 59) {
      valx2 = -25;
    } else if (pixel > 59 && pixel < 62) {
      valx2 = -24;
    } else if (pixel > 62 && pixel < 64) {
      valx2 = -23;
    } else if (pixel > 64 && pixel < 66) {
      valx2 = -22;
    } else if (pixel > 66 && pixel < 68) {
      valx2 = -21;
    } else if (pixel > 68 && pixel < 71) {
      valx2 = -20;
    } else if (pixel > 71 && pixel < 73) {
      valx2 = -19;
    } else if (pixel > 73 && pixel < 75) {
      valx2 = -18;
    } else if (pixel > 75 && pixel < 77) {
      valx2 = -17;
    } else if (pixel > 77 && pixel < 80) {
      valx2 = -16;
    } else if (pixel > 80 && pixel < 82) {
      valx2 = -15;
    } else if (pixel > 82 && pixel < 84) {
      valx2 = -14;
    } else if (pixel > 84 && pixel < 86) {
      valx2 = -13;
    } else if (pixel > 86 && pixel < 89) {
      valx2 = -12;
    } else if (pixel > 89 && pixel < 91) {
      valx2 = -11;
    } else if (pixel > 91 && pixel < 93) {
      valx2 = -10;
    } else if (pixel > 93 && pixel < 95) {
      valx2 = -9;
    } else if (pixel > 95 && pixel < 98) {
      valx2 = -8;
    } else if (pixel > 98 && pixel < 100) {
      valx2 = -7;
    } else if (pixel > 100 && pixel < 102) {
      valx2 = -6;
    } else if (pixel > 102 && pixel < 104) {
      valx2 = -5;
    } else if (pixel > 104 && pixel < 107) {
      valx2 = -4;
    } else if (pixel > 107 && pixel < 109) {
      valx2 = -3;
    } else if (pixel > 109 && pixel < 111) {
      valx2 = -2;
    } else if (pixel > 111 && pixel < 113) {
      valx2 = -1;
    } else if (pixel > 113 && pixel < 116) {
      valx2 = -0;
    } else if (pixel > 116 && pixel < 118) {
      valx2 = 1;
    } else if (pixel > 118 && pixel < 120) {
      valx2 = 2;
    } else if (pixel > 120 && pixel < 122) {
      valx2 = 3;
    } else if (pixel > 122 && pixel < 125) {
      valx2 = 4;
    } else if (pixel > 125 && pixel < 127) {
      valx2 = 5;
    } else if (pixel > 127 && pixel < 129) {
      valx2 = 6;
    } else if (pixel > 129 && pixel < 131) {
      valx2 = 7;
    } else if (pixel > 131 && pixel < 134) {
      valx2 = 8;
    } else if (pixel > 134 && pixel < 136) {
      valx2 = 9;
    } else if (pixel > 136 && pixel < 138) {
      valx2 = 10;
    } else if (pixel > 138 && pixel < 140) {
      valx2 = 11;
    } else if (pixel > 140 && pixel < 143) {
      valx2 = 12;
    } else if (pixel > 143 && pixel < 145) {
      valx2 = 13;
    } else if (pixel > 145 && pixel < 147) {
      valx2 = 14;
    } else if (pixel > 147 && pixel < 149) {
      valx2 = 15;
    } else if (pixel > 149 && pixel < 152) {
      valx2 = 16;
    } else if (pixel > 152 && pixel < 154) {
      valx2 = 17;
    } else if (pixel > 154 && pixel < 156) {
      valx2 = 18;
    } else if (pixel > 156 && pixel < 158) {
      valx2 = 19;
    } else if (pixel > 158 && pixel < 161) {
      valx2 = 20;
    } else if (pixel > 161 && pixel < 163) {
      valx2 = 21;
    } else if (pixel > 163 && pixel < 165) {
      valx2 = 22;
    } else if (pixel > 165 && pixel < 167) {
      valx2 = 23;
    } else if (pixel > 167 && pixel < 170) {
      valx2 = 24;
    } else if (pixel > 170 && pixel < 172) {
      valx2 = 25;
    } else if (pixel > 172 && pixel < 174) {
      valx2 = 26;
    } else if (pixel > 174 && pixel < 176) {
      valx2 = 27;
    } else if (pixel > 176 && pixel < 179) {
      valx2 = 28;
    } else if (pixel > 179 && pixel < 181) {
      valx2 = 29;
    } else if (pixel > 181 && pixel < 183) {
      valx2 = 30;
    } else if (pixel > 183 && pixel < 185) {
      valx2 = 31;
    } else if (pixel > 185 && pixel < 188) {
      valx2 = 32;
    } else if (pixel > 188 && pixel < 190) {
      valx2 = 33;
    } else if (pixel > 190 && pixel < 192) {
      valx2 = 34;
    } else if (pixel > 192 && pixel < 194) {
      valx2 = 35;
    } else if (pixel > 194 && pixel < 197) {
      valx2 = 36;
    } else if (pixel > 197 && pixel < 199) {
      valx2 = 37;
    } else if (pixel > 199 && pixel < 201) {
      valx2 = 38;
    } else if (pixel > 201 && pixel < 203) {
      valx2 = 39;
    } else if (pixel > 203 && pixel < 206) {
      valx2 = 40;
    } else if (pixel > 206 && pixel < 208) {
      valx2 = 41;
    } else if (pixel > 208 && pixel < 210) {
      valx2 = 42;
    } else if (pixel > 210 && pixel < 212) {
      valx2 = 43;
    } else if (pixel > 212 && pixel < 215) {
      valx2 = 44;
    } else if (pixel > 215 && pixel < 217) {
      valx2 = 45;
    } else if (pixel > 217 && pixel < 219) {
      valx2 = 46;
    } else if (pixel > 219 && pixel < 221) {
      valx2 = 47;
    } else if (pixel > 221 && pixel < 224) {
      valx2 = 48;
    } else if (pixel > 224 && pixel < 226) {
      valx2 = 49;
    } else if (pixel > 226 && pixel < 228) {
      valx2 = 50;
    } else if (pixel > 228 && pixel < 310) {
      valx2 = 50;
    } else {
      //valx2 = 0;
    }
    //print('x2 :: $valx2');

    print('Pixel :: $pixel' +
        '     ' +
        'y2 :: $valy2' +
        '      ' +
        'x2 :: $valx2');

    varibleP.x2 = valx2.toStringAsFixed(0);
  }
}
