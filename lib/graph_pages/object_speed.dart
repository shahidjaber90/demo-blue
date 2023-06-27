import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config.dart';

class ObjectSpeedPage extends StatefulWidget {
  @override
  _ObjectSpeedPageState createState() => _ObjectSpeedPageState();
}

class _ObjectSpeedPageState extends State<ObjectSpeedPage>
    with WidgetsBindingObserver {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  double onePoint = 4;
  double objectValL = 0;

  @override
  void initState() {
    print('landscaping initState sweep_speed');

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('print dy value in initstate.. ${objectOffset.dy}');
    print('print objectPosy0 value in initstate.. ${objectPosy0}');
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('super dispose Appo');

    super.dispose();
    print(' disposed App');
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.resumed) {
      print(' app is resumed---------');
    } else if (state == AppLifecycleState.inactive) {
      print(' app is inactive---------');
    } else if (state == AppLifecycleState.detached) {
      print(' app is detached---------');
    } else if (state == AppLifecycleState.paused) {
      print(' app is pasued---------');
    } else {
      print('unknown App State');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        print('data');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: Container(
          padding: EdgeInsets.all(10),
          child: OrientationBuilder(
            builder: (context, orientation) => buildLandscape(),
          ),
        ),
      ),
    );
  }

  Widget buildLandscape() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OBJECT ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25)),
              Text(' - ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25)),
              Text(' SPEED ',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.normal,
                      fontSize: 25)),
            ],
          ),
        ),
        Positioned(
          top: screenHeight * 0.20,
          left: screenWidth * 0.001,
          child: Column(
            children: [
              // SizedBox(height: screenHeight * 0.2,),
              Text(' Max ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25)),
              SizedBox(
                height: screenHeight * 0.3,
              ),
              Text(' Min ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25)),
            ],
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.05,
          left: screenWidth * 0.38,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1, color: Colors.deepOrange),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(120, 60),
              maximumSize: Size(120, 60),
            ),
            onPressed: () {
              Navigator.pop(context);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            },
            child: Text(
              'BACK',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        new Positioned(
          key: GlobalKey(),
          top: screenHeight * 0.62,
          left: MediaQuery.of(context).size.width * 0.1,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width * 0.85,
            color: Colors.black,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 8,
                titlesData: FlTitlesData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xff808080),
                      strokeWidth: 1,
                    );
                  },
                  drawVerticalLine: false,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                      bottom: BorderSide(color: Colors.deepOrange, width: 20)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, objectPosy0),
                      FlSpot(1, objectPosy1),
                      FlSpot(2, objectPosy2),
                      FlSpot(3, objectPosy3),
                      FlSpot(4, objectPosy4),
                      FlSpot(5, objectPosy5),
                      FlSpot(6, objectPosy6),
                      FlSpot(7, objectPosy7),
                      FlSpot(8, objectPosy8),
                      FlSpot(9, objectPosy9),
                      FlSpot(10, objectPosy10),
                    ],
                    isCurved: true,
                    color: const Color(0xffd6d6d6),
                    barWidth: 6,
                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                              radius: 5, color: Colors.grey.withOpacity(1)),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xffd6d6d6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        new Positioned(
            left: screenWidth * 0.42,
            top: objectOffset.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                // print('papa');
                // print('Y value :: ${details.delta.dy}');
                setState(() {
                  // print(objectOffset.dy/3);
                  // print('details :: ${details.delta.dy}');

                  if (objectOffset.dy < 50) {
                    objectOffset = Offset(objectOffset.dx, 50);
                    objectPosy0 = objectPosy0;
                    objectPosy1 = objectPosy1;
                    objectPosy2 = objectPosy2;
                    objectPosy3 = objectPosy3;
                    objectPosy4 = objectPosy4;
                    objectPosy5 = objectPosy5;
                    objectPosy6 = objectPosy6;
                    objectPosy7 = objectPosy7;
                    objectPosy8 = objectPosy8;
                    objectPosy9 = objectPosy9;
                    objectPosy10 = objectPosy10;
                  } else if (objectOffset.dy == 50) {
                    objectOffset = Offset(objectOffset.dx + details.delta.dx,
                        objectOffset.dy + details.delta.dy);
                    objectPosy0 = objectPosy0;
                    objectPosy1 = objectPosy1;
                    objectPosy2 = objectPosy2;
                    objectPosy3 = objectPosy3;
                    objectPosy4 = objectPosy4;
                    objectPosy5 = objectPosy5;
                    objectPosy6 = objectPosy6;
                    objectPosy7 = objectPosy7;
                    objectPosy8 = objectPosy8;
                    objectPosy9 = objectPosy9;
                    objectPosy10 = objectPosy10;
                  } else if (objectOffset.dy > 200) {
                    objectOffset = Offset(objectOffset.dx, 200);
                    objectPosy0 = objectPosy0;
                    objectPosy1 = objectPosy1;
                    objectPosy2 = objectPosy2;
                    objectPosy3 = objectPosy3;
                    objectPosy4 = objectPosy4;
                    objectPosy5 = objectPosy5;
                    objectPosy6 = objectPosy6;
                    objectPosy7 = objectPosy7;
                    objectPosy8 = objectPosy8;
                    objectPosy9 = objectPosy9;
                    objectPosy10 = objectPosy10;
                  } else if (objectOffset.dy == 200) {
                    objectOffset = Offset(objectOffset.dx + details.delta.dx,
                        objectOffset.dy + details.delta.dy);
                    objectPosy0 = objectPosy0;
                    objectPosy1 = objectPosy1;
                    objectPosy2 = objectPosy2;
                    objectPosy3 = objectPosy3;
                    objectPosy4 = objectPosy4;
                    objectPosy5 = objectPosy5;
                    objectPosy6 = objectPosy6;
                    objectPosy7 = objectPosy7;
                    objectPosy8 = objectPosy8;
                    objectPosy9 = objectPosy9;
                    objectPosy10 = objectPosy10;
                  } else {
                    objectOffset = Offset(objectOffset.dx + details.delta.dx,
                        objectOffset.dy + details.delta.dy);
                    objectPosy0 = objectPosy0 - 1.95 * details.delta.dy;
                    objectPosy1 = objectPosy1 - 1.95 * details.delta.dy;
                    objectPosy2 = objectPosy2 - 1.95 * details.delta.dy;
                    objectPosy3 = objectPosy3 - 1.95 * details.delta.dy;
                    objectPosy4 = objectPosy4 - 1.95 * details.delta.dy;
                    objectPosy5 = objectPosy5 - 1.95 * details.delta.dy;
                    objectPosy6 = objectPosy6 - 1.95 * details.delta.dy;
                    objectPosy7 = objectPosy7 - 1.95 * details.delta.dy;
                    objectPosy8 = objectPosy8 - 1.95 * details.delta.dy;
                    objectPosy9 = objectPosy9 - 1.95 * details.delta.dy;
                    objectPosy10 = objectPosy10 - 1.95 * details.delta.dy;
                    // print('in else');
                  }

                  setObjectLveriable(objectOffset.dy / 3);
                });
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.transparent,
                    )),
                child: Container(
                  height: 15,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.deepOrange,
                      )),
                ),
              ),
            )),
      ],
    );
  }

  void setObjectLveriable(double pixel) {
    if (pixel < 17) {
      objectValL = 30;
    } else if (pixel > 17 && pixel < 19) {
      objectValL = 29;
    } else if (pixel > 19 && pixel < 20) {
      objectValL = 28;
    } else if (pixel > 20 && pixel < 22) {
      objectValL = 27;
    } else if (pixel > 22 && pixel < 24) {
      objectValL = 26;
    } else if (pixel > 24 && pixel < 26) {
      objectValL = 25;
    } else if (pixel > 26 && pixel < 28) {
      objectValL = 24;
    } else if (pixel > 28 && pixel < 30) {
      objectValL = 23;
    } else if (pixel > 30 && pixel < 32) {
      objectValL = 22;
    } else if (pixel > 32 && pixel < 34) {
      objectValL = 21;
    } else if (pixel > 34 && pixel < 36) {
      objectValL = 20;
    } else if (pixel > 36 && pixel < 38) {
      objectValL = 19;
    } else if (pixel > 38 && pixel < 40) {
      objectValL = 18;
    } else if (pixel > 40 && pixel < 42) {
      objectValL = 17;
    } else if (pixel > 42 && pixel < 45) {
      objectValL = 16;
    } else if (pixel > 45 && pixel < 48) {
      objectValL = 15;
    } else if (pixel > 48 && pixel < 50) {
      objectValL = 14;
    } else if (pixel > 50 && pixel < 51) {
      objectValL = 13;
    } else if (pixel > 51 && pixel < 52) {
      objectValL = 12;
    } else if (pixel > 52 && pixel < 53) {
      objectValL = 11;
    } else if (pixel > 53 && pixel < 54) {
      objectValL = 10;
    } else if (pixel > 54 && pixel < 55) {
      objectValL = 09;
    } else if (pixel > 55 && pixel < 56) {
      objectValL = 08;
    } else if (pixel > 56 && pixel < 57) {
      objectValL = 07;
    } else if (pixel > 57 && pixel < 58) {
      objectValL = 06;
    } else if (pixel > 58 && pixel < 60) {
      objectValL = 05;
    } else if (pixel > 60 && pixel < 62) {
      objectValL = 04;
    } else if (pixel > 62 && pixel < 63) {
      objectValL = 03;
    } else if (pixel > 63 && pixel < 64) {
      objectValL = 02;
    } else if (pixel > 64 && pixel < 66) {
      objectValL = 01;
    } else if (pixel > 66) {
      objectValL = 00;
    } else {
      objectValL = 0;
    }

    // if(pixel >20 && pixel <50){
    //   print('yapooooo');
    // }else{
    //   print('nooooooo');
    // }
    print(objectValL);
    variableO.L = objectValL.toString();
  }
}
