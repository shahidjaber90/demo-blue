import 'package:flutter/material.dart';
import '../config.dart';
import '../widgets/line_painter.dart';
import '../widgets/line_painter2.dart';

class ObjectCircle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyWidgetState();
  }
}

class MyWidgetState extends State<ObjectCircle> {
  double botCircleX = 0;
  double botCircleY = 0;

  double topCircleX = 135;
  double topCircleY = 20;

  int x = 1;

  double objectValY = 0;
  double objectValX = 0;

  void onTapDown(BuildContext context, TapDownDetails details) {
    visibilityObject = true;
    print(' Global Position :: ${details.globalPosition}');
    // final RenderObject? box = context.findRenderObject();
    // final Offset localOffset = box.globalToLocal(details.globalPosition);
    final RenderObject? box = context.findRenderObject();
    if (box is RenderBox) {
      print('box true');
      Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        if (x == 1) {
          x = x + 1;
          posxObject = localOffset.dx;
          posyObject = localOffset.dy;
          settingUpObjectValY(posxObject);
          settingUpObjectValX(posyObject);
        } else {
          return;
        }
      });
    } else {
      print('box false');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    botCircleX = screenWidth / 5.4; //2,2 grey dot - horisontal
    botCircleY = screenHeight / 5.6; //3 - grey dot - vertical
    topCircleX = screenWidth / 1.4; //2,2 - orange dot - horisontal
    topCircleY = screenHeight / 5.6; //30 - orange dot vertical
    return new GestureDetector(
      onTapDown: (TapDownDetails details) => onTapDown(context, details),
      child: Center(
        child: new Stack(fit: StackFit.expand, children: <Widget>[
          // Hack to expand stack to fill all the space. There must be a better
          // way to do it.

          new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.deepOrange),
              shape: BoxShape.rectangle,
              //color: Colors.grey.shade700,
            ),
          ),

          new Visibility(
            visible: visibilityObject,
            child: Positioned(
              child: CustomPaint(
                foregroundPainter: LinePainter2(
                    Offset(botCircleX + 10, botCircleY + 10),
                    Offset(posxObject + 12.5, posyObject + 12.5),
                    Color(0xFF2C5066)),
              ),
            ),
          ),

          Visibility(
            visible: visibilityObject,
            child: new Positioned(
              child: CustomPaint(
                foregroundPainter: LinePainter2(
                    Offset(topCircleX + 12.5, topCircleY + 10),
                    Offset(posxObject + 12.5, posyObject + 11),
                    Color(0xFF2C5066)),
              ),
            ),
          ),

          new Positioned(
            child: CustomPaint(
              foregroundPainter: LinePainter(
                  Offset(topCircleX + 10, topCircleY + 11), //right line point
                  Offset(botCircleX + 10, botCircleY + 11), //left line point
                  Color(0xff808080)),
            ),
          ),

          new Positioned(
            child: new Container(
              height: 22, //23
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

          new Positioned(
            child: new Container(
              height: 22, //22 left circle
              width: 22, //22
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                shape: BoxShape.circle,
              ),
            ),
            left: botCircleX,
            top: botCircleY,
          ),

          Visibility(
            visible: visibilityObject,
            child: new Positioned(
              child: GestureDetector(
                onPanUpdate: (details) {
                  final RenderObject? box = context.findRenderObject();
                  if (box is RenderBox) {
                    Offset localOffset =
                        box.globalToLocal(details.globalPosition);
                    setState(() {
                      posxObject = localOffset.dx;
                      posyObject = localOffset.dy;
                      settingUpObjectValY(posxObject); // changed place
                      settingUpObjectValX(posyObject);
                    });
                  }
                },
                child: Container(
                  child: new Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      //border: Border.all(width: 2, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              left: posxObject,
              top: posyObject,
            ),
          ),
        ]),
      ),
    );
  }

  void settingUpObjectValY(double pixel) {
    if (pixel > 312) {
      objectValY = 100;
    } else if (pixel < 312 && pixel > 309) {
      objectValY = 99;
    } else if (pixel < 309 && pixel > 306) {
      objectValY = 98;
    } else if (pixel < 306 && pixel > 303) {
      objectValY = 97;
    } else if (pixel < 303 && pixel > 299) {
      objectValY = 96;
    } else if (pixel < 299 && pixel > 296) {
      objectValY = 95;
    } else if (pixel < 296 && pixel > 293) {
      objectValY = 94;
    } else if (pixel < 293 && pixel > 290) {
      objectValY = 93;
    } else if (pixel < 290 && pixel > 287) {
      objectValY = 92;
    } else if (pixel < 287 && pixel > 284) {
      objectValY = 91;
    } else if (pixel < 284 && pixel > 281) {
      objectValY = 90;
    } else if (pixel < 281 && pixel > 278) {
      objectValY = 89;
    } else if (pixel < 278 && pixel > 275) {
      objectValY = 88;
    } else if (pixel < 275 && pixel > 271) {
      objectValY = 87;
    } else if (pixel < 271 && pixel > 268) {
      objectValY = 86;
    } else if (pixel < 268 && pixel > 265) {
      objectValY = 85;
    } else if (pixel < 265 && pixel > 262) {
      objectValY = 84;
    } else if (pixel < 262 && pixel > 259) {
      objectValY = 83;
    } else if (pixel < 259 && pixel > 256) {
      objectValY = 82;
    } else if (pixel < 256 && pixel > 253) {
      objectValY = 81;
    } else if (pixel < 253 && pixel > 250) {
      objectValY = 80;
    } else if (pixel < 250 && pixel > 247) {
      objectValY = 79;
    } else if (pixel < 247 && pixel > 243) {
      objectValY = 78;
    } else if (pixel < 243 && pixel > 240) {
      objectValY = 77;
    } else if (pixel < 240 && pixel > 237) {
      objectValY = 76;
    } else if (pixel < 237 && pixel > 234) {
      objectValY = 75;
    } else if (pixel < 234 && pixel > 231) {
      objectValY = 74;
    } else if (pixel < 231 && pixel > 228) {
      objectValY = 73;
    } else if (pixel < 228 && pixel > 225) {
      objectValY = 72;
    } else if (pixel < 225 && pixel > 222) {
      objectValY = 71;
    } else if (pixel < 222 && pixel > 219) {
      objectValY = 70;
    } else if (pixel < 219 && pixel > 215) {
      objectValY = 69;
    } else if (pixel < 215 && pixel > 212) {
      objectValY = 68;
    } else if (pixel < 212 && pixel > 209) {
      objectValY = 67;
    } else if (pixel < 209 && pixel > 206) {
      objectValY = 66;
    } else if (pixel < 206 && pixel > 203) {
      objectValY = 65;
    } else if (pixel < 203 && pixel > 200) {
      objectValY = 64;
    } else if (pixel < 200 && pixel > 197) {
      objectValY = 63;
    } else if (pixel < 197 && pixel > 194) {
      objectValY = 62;
    } else if (pixel < 194 && pixel > 191) {
      objectValY = 61;
    } else if (pixel < 191 && pixel > 187) {
      objectValY = 60;
    } else if (pixel < 187 && pixel > 184) {
      objectValY = 59;
    } else if (pixel < 184 && pixel > 181) {
      objectValY = 58;
    } else if (pixel < 181 && pixel > 178) {
      objectValY = 57;
    } else if (pixel < 178 && pixel > 175) {
      objectValY = 56;
    } else if (pixel < 175 && pixel > 172) {
      objectValY = 55;
    } else if (pixel < 172 && pixel > 169) {
      objectValY = 54;
    } else if (pixel < 169 && pixel > 166) {
      objectValY = 53;
    } else if (pixel < 166 && pixel > 163) {
      objectValY = 52;
    } else if (pixel < 163 && pixel > 160) {
      objectValY = 51;
    } else if (pixel < 160 && pixel > 156) {
      objectValY = 50;
    } else if (pixel < 156 && pixel > 153) {
      objectValY = 49;
    } else if (pixel < 153 && pixel > 150) {
      objectValY = 48;
    } else if (pixel < 150 && pixel > 147) {
      objectValY = 47;
    } else if (pixel < 147 && pixel > 144) {
      objectValY = 46;
    } else if (pixel < 144 && pixel > 141) {
      objectValY = 45;
    } else if (pixel < 141 && pixel > 138) {
      objectValY = 44;
    } else if (pixel < 138 && pixel > 135) {
      objectValY = 43;
    } else if (pixel < 135 && pixel > 132) {
      objectValY = 42;
    } else if (pixel < 132 && pixel > 128) {
      objectValY = 41;
    } else if (pixel < 128 && pixel > 125) {
      objectValY = 40;
    } else if (pixel < 125 && pixel > 122) {
      objectValY = 39;
    } else if (pixel < 122 && pixel > 119) {
      objectValY = 38;
    } else if (pixel < 119 && pixel > 116) {
      objectValY = 37;
    } else if (pixel < 116 && pixel > 113) {
      objectValY = 36;
    } else if (pixel < 113 && pixel > 110) {
      objectValY = 35;
    } else if (pixel < 110 && pixel > 107) {
      objectValY = 34;
    } else if (pixel < 107 && pixel > 104) {
      objectValY = 33;
    } else if (pixel < 104 && pixel > 100) {
      objectValY = 32;
    } else if (pixel < 100 && pixel > 97) {
      objectValY = 31;
    } else if (pixel < 97 && pixel > 94) {
      objectValY = 30;
    } else if (pixel < 94 && pixel > 91) {
      objectValY = 29;
    } else if (pixel < 91 && pixel > 88) {
      objectValY = 28;
    } else if (pixel < 88 && pixel > 85) {
      objectValY = 27;
    } else if (pixel < 85 && pixel > 82) {
      objectValY = 26;
    } else if (pixel < 82 && pixel > 79) {
      objectValY = 25;
    } else if (pixel < 79 && pixel > 76) {
      objectValY = 24;
    } else if (pixel < 76 && pixel > 72) {
      objectValY = 23;
    } else if (pixel < 72 && pixel > 69) {
      objectValY = 22;
    } else if (pixel < 69 && pixel > 66) {
      objectValY = 21;
    } else if (pixel < 66 && pixel > 63) {
      objectValY = 20;
    } else if (pixel < 63 && pixel > 60) {
      objectValY = 19;
    } else if (pixel < 60 && pixel > 57) {
      objectValY = 18;
    } else if (pixel < 57 && pixel > 54) {
      objectValY = 17;
    } else if (pixel < 54 && pixel > 51) {
      objectValY = 16;
    } else if (pixel < 51 && pixel > 48) {
      objectValY = 15;
    } else if (pixel < 48 && pixel > 44) {
      objectValY = 14;
    } else if (pixel < 44 && pixel > 41) {
      objectValY = 13;
    } else if (pixel < 41 && pixel > 38) {
      objectValY = 12;
    } else if (pixel < 38 && pixel > 35) {
      objectValY = 11;
    } else if (pixel < 35 && pixel > 32) {
      objectValY = 10;
    } else if (pixel < 32 && pixel > 29) {
      objectValY = 9;
    } else if (pixel < 29 && pixel > 26) {
      objectValY = 8;
    } else if (pixel < 26 && pixel > 23) {
      objectValY = 7;
    } else if (pixel < 23 && pixel > 20) {
      objectValY = 6;
    } else if (pixel < 20 && pixel > 16) {
      objectValY = 5;
    } else if (pixel < 16 && pixel > 13) {
      objectValY = 4;
    } else if (pixel < 13 && pixel > 10) {
      objectValY = 3;
    } else if (pixel < 10 && pixel > 7) {
      objectValY = 2;
    } else if (pixel < 7 && pixel > 4) {
      objectValY = 1;
    } else if (pixel < 4 && pixel > 0) {
      objectValY = 0;
    } else if (pixel < 0) {
      objectValY = 0;
    } else {
      //objectValY = 0;
    }

    //print('Pixel :: $pixel'+'     '+'y :: $objectValY'+'      '+'x :: $objectValX');
  }

  void settingUpObjectValX(double pixel) {
    //print(pixel);
    if (pixel < 3) {
      objectValX = -50;
    } else if (pixel > 3 && pixel < 5) {
      objectValX = -49;
    } else if (pixel > 5 && pixel < 8) {
      objectValX = -48;
    } else if (pixel > 8 && pixel < 10) {
      objectValX = -47;
    } else if (pixel > 10 && pixel < 12) {
      objectValX = -46;
    } else if (pixel > 12 && pixel < 14) {
      objectValX = -45;
    } else if (pixel > 14 && pixel < 17) {
      objectValX = -44;
    } else if (pixel > 17 && pixel < 19) {
      objectValX = -43;
    } else if (pixel > 19 && pixel < 21) {
      objectValX = -42;
    } else if (pixel > 21 && pixel < 23) {
      objectValX = -41;
    } else if (pixel > 23 && pixel < 26) {
      objectValX = -40;
    } else if (pixel > 26 && pixel < 28) {
      objectValX = -39;
    } else if (pixel > 28 && pixel < 30) {
      objectValX = -38;
    } else if (pixel > 30 && pixel < 32) {
      objectValX = -37;
    } else if (pixel > 32 && pixel < 35) {
      objectValX = -36;
    } else if (pixel > 35 && pixel < 37) {
      objectValX = -35;
    } else if (pixel > 37 && pixel < 39) {
      objectValX = -34;
    } else if (pixel > 39 && pixel < 41) {
      objectValX = -33;
    } else if (pixel > 41 && pixel < 44) {
      objectValX = -32;
    } else if (pixel > 44 && pixel < 46) {
      objectValX = -31;
    } else if (pixel > 46 && pixel < 48) {
      objectValX = -30;
    } else if (pixel > 48 && pixel < 50) {
      objectValX = -29;
    } else if (pixel > 50 && pixel < 53) {
      objectValX = -28;
    } else if (pixel > 53 && pixel < 55) {
      objectValX = -27;
    } else if (pixel > 55 && pixel < 57) {
      objectValX = -26;
    } else if (pixel > 57 && pixel < 59) {
      objectValX = -25;
    } else if (pixel > 59 && pixel < 62) {
      objectValX = -24;
    } else if (pixel > 62 && pixel < 64) {
      objectValX = -23;
    } else if (pixel > 64 && pixel < 66) {
      objectValX = -22;
    } else if (pixel > 66 && pixel < 68) {
      objectValX = -21;
    } else if (pixel > 68 && pixel < 71) {
      objectValX = -20;
    } else if (pixel > 71 && pixel < 73) {
      objectValX = -19;
    } else if (pixel > 73 && pixel < 75) {
      objectValX = -18;
    } else if (pixel > 75 && pixel < 77) {
      objectValX = -17;
    } else if (pixel > 77 && pixel < 80) {
      objectValX = -16;
    } else if (pixel > 80 && pixel < 82) {
      objectValX = -15;
    } else if (pixel > 82 && pixel < 84) {
      objectValX = -14;
    } else if (pixel > 84 && pixel < 86) {
      objectValX = -13;
    } else if (pixel > 86 && pixel < 89) {
      objectValX = -12;
    } else if (pixel > 89 && pixel < 91) {
      objectValX = -11;
    } else if (pixel > 91 && pixel < 93) {
      objectValX = -10;
    } else if (pixel > 93 && pixel < 95) {
      objectValX = -9;
    } else if (pixel > 95 && pixel < 98) {
      objectValX = -8;
    } else if (pixel > 98 && pixel < 100) {
      objectValX = -7;
    } else if (pixel > 100 && pixel < 102) {
      objectValX = -6;
    } else if (pixel > 102 && pixel < 104) {
      objectValX = -5;
    } else if (pixel > 104 && pixel < 107) {
      objectValX = -4;
    } else if (pixel > 107 && pixel < 109) {
      objectValX = -3;
    } else if (pixel > 109 && pixel < 111) {
      objectValX = -2;
    } else if (pixel > 111 && pixel < 113) {
      objectValX = -1;
    } else if (pixel > 113 && pixel < 116) {
      objectValX = -0;
    } else if (pixel > 116 && pixel < 118) {
      objectValX = 1;
    } else if (pixel > 118 && pixel < 120) {
      objectValX = 2;
    } else if (pixel > 120 && pixel < 122) {
      objectValX = 3;
    } else if (pixel > 122 && pixel < 125) {
      objectValX = 4;
    } else if (pixel > 125 && pixel < 127) {
      objectValX = 5;
    } else if (pixel > 127 && pixel < 129) {
      objectValX = 6;
    } else if (pixel > 129 && pixel < 131) {
      objectValX = 7;
    } else if (pixel > 131 && pixel < 134) {
      objectValX = 8;
    } else if (pixel > 134 && pixel < 136) {
      objectValX = 9;
    } else if (pixel > 136 && pixel < 138) {
      objectValX = 10;
    } else if (pixel > 138 && pixel < 140) {
      objectValX = 11;
    } else if (pixel > 140 && pixel < 143) {
      objectValX = 12;
    } else if (pixel > 143 && pixel < 145) {
      objectValX = 13;
    } else if (pixel > 145 && pixel < 147) {
      objectValX = 14;
    } else if (pixel > 147 && pixel < 149) {
      objectValX = 15;
    } else if (pixel > 149 && pixel < 152) {
      objectValX = 16;
    } else if (pixel > 152 && pixel < 154) {
      objectValX = 17;
    } else if (pixel > 154 && pixel < 156) {
      objectValX = 18;
    } else if (pixel > 156 && pixel < 158) {
      objectValX = 19;
    } else if (pixel > 158 && pixel < 161) {
      objectValX = 20;
    } else if (pixel > 161 && pixel < 163) {
      objectValX = 21;
    } else if (pixel > 163 && pixel < 165) {
      objectValX = 22;
    } else if (pixel > 165 && pixel < 167) {
      objectValX = 23;
    } else if (pixel > 167 && pixel < 170) {
      objectValX = 24;
    } else if (pixel > 170 && pixel < 172) {
      objectValX = 25;
    } else if (pixel > 172 && pixel < 174) {
      objectValX = 26;
    } else if (pixel > 174 && pixel < 176) {
      objectValX = 27;
    } else if (pixel > 176 && pixel < 179) {
      objectValX = 28;
    } else if (pixel > 179 && pixel < 181) {
      objectValX = 29;
    } else if (pixel > 181 && pixel < 183) {
      objectValX = 30;
    } else if (pixel > 183 && pixel < 185) {
      objectValX = 31;
    } else if (pixel > 185 && pixel < 188) {
      objectValX = 32;
    } else if (pixel > 188 && pixel < 190) {
      objectValX = 33;
    } else if (pixel > 190 && pixel < 192) {
      objectValX = 34;
    } else if (pixel > 192 && pixel < 194) {
      objectValX = 35;
    } else if (pixel > 194 && pixel < 197) {
      objectValX = 36;
    } else if (pixel > 197 && pixel < 199) {
      objectValX = 37;
    } else if (pixel > 199 && pixel < 201) {
      objectValX = 38;
    } else if (pixel > 201 && pixel < 203) {
      objectValX = 39;
    } else if (pixel > 203 && pixel < 206) {
      objectValX = 40;
    } else if (pixel > 206 && pixel < 208) {
      objectValX = 41;
    } else if (pixel > 208 && pixel < 210) {
      objectValX = 42;
    } else if (pixel > 210 && pixel < 212) {
      objectValX = 43;
    } else if (pixel > 212 && pixel < 215) {
      objectValX = 44;
    } else if (pixel > 215 && pixel < 217) {
      objectValX = 45;
    } else if (pixel > 217 && pixel < 219) {
      objectValX = 46;
    } else if (pixel > 219 && pixel < 221) {
      objectValX = 47;
    } else if (pixel > 221 && pixel < 224) {
      objectValX = 48;
    } else if (pixel > 224 && pixel < 226) {
      objectValX = 49;
    } else if (pixel > 226 && pixel < 228) {
      objectValX = 50;
    } else if (pixel > 228 && pixel < 310) {
      objectValX = 50;
    } else {
      //objectValX = 0;
    }

    print('Pixel :: $pixel' +
        '     ' +
        'y :: $objectValY' +
        '      ' +
        'x :: $objectValX');

    variableO.X = objectValX.toStringAsFixed(0);
    variableO.Y = objectValY.toStringAsFixed(0);

    //variableO.X = objectValX.toStringAsFixed(0);
  }
}
