import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../bluetooth_api/bluetooth_api.dart';
import '../screens/sweep_screen.dart';

class GoSweepPage extends StatefulWidget {
  @override
  State<GoSweepPage> createState() => _GoSweepPageState();
}

class _GoSweepPageState extends State<GoSweepPage> {
  bool showBackButton = true;
  String mainButtontext = 'GO';
  Color mainButtonColors = Colors.green.shade800;
  Color backButtonColor = Colors.grey.shade800;
  String backButtonText = 'BACK';
  static const maxSeconds = 0;
  int seconds = maxSeconds;
  Timer? timer;
  String actionButtonText = 'Play';
  int myseconds = 5;
  bool isRunning = true;
  BlueToothApi blue = BlueToothApi();
  bool isTimerComplete = false; // New variable to track timer completion
  Color containerColor = Colors.red; // Initial color of the container


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white12,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight / 25),
            Container(
              color: Colors.deepOrange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.transparent),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        primary: Colors.white,
                        backgroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SweepScreen()));
                        //Navigator.pop(context);
                      },
                      child: FittedBox(
                        child: Text(
                          '<',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w900,
                              fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      'GO SWEEP',
                      style: TextStyle(
                          letterSpacing: 3,
                          fontFamily: 'Title',
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.transparent),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoSweepPage()));
                      },
                      child: const FittedBox(
                        child: Text(
                          '>',
                          style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 35,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight / 9),
            const Text(
              'STOPWATCH',
              style: TextStyle(
                  letterSpacing: 3,
                  fontFamily: 'Title',
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('increase second value by 10..');
                          setState(() {
                            if (seconds < 51) {
                              seconds = seconds + 10;
                            }
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretUp,
                          color: Colors.white,
                          size: 40,
                        )),
                    SizedBox(
                      height: screenHeight / 50,
                    ),
                    IconButton(
                        onPressed: () {
                          print('decrease second value by 10..');
                          setState(() {
                            if (seconds > 9) {
                              seconds = seconds - 10;
                            }
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                          size: 40,
                        )),
                  ],
                ),
                SizedBox(
                  width: screenWidth / 60,
                ),
                buildTime(),
                SizedBox(
                  width: screenWidth / 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('increase second value by 1.');
                          setState(() {
                            if (seconds < 59) {
                              seconds = seconds + 1;
                            }
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretUp,
                          color: Colors.white,
                          size: 40,
                        )),
                    SizedBox(
                      height: screenHeight / 50,
                    ),
                    IconButton(
                        onPressed: () {
                          print('decrease second value by 1..');
                          setState(() {
                            if (seconds > 0) {
                              seconds = seconds - 1;
                            }
                          });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                          size: 40,
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),


            SizedBox(height:20),
            Container(
              // margin: EdgeInsets.all(appPadding),
              // padding: EdgeInsets.all(appPadding),
              height: 200,
              width: 200,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                      maximum: 59,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 270,
                      endAngle: 270,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.05,
                        color:  Colors.green,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          angle: 180,
                          widget: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [

                              Center(
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: seconds.toDouble(),
                            // cornerStyle: CornerStyle.bothCurve,
                            enableAnimation: true,
                            animationDuration: 1200,
                            sizeUnit: GaugeSizeUnit.factor,
                            color: Colors.green,
                            width: 100
                        )
                      ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.transparent),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                foregroundColor: Colors.white,
                backgroundColor: (seconds > 0) ? mainButtonColors : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                minimumSize: const Size(250, 150),
              ),
              onPressed: () {
                setState(() {
                  if (mainButtontext == 'GO') {
                    startTimer();
                    mainButtontext = 'Pause';
                    mainButtonColors = Colors.yellow.shade800;
                  } else {
                    stopTimer();
                    mainButtontext = 'GO';
                    mainButtonColors = Colors.green.shade800;
                  }


                });
              },
              child: FittedBox(
                child: Text(
                  (seconds > 0) ? mainButtontext : 'Stop',
                  style: TextStyle(
                    fontFamily: 'Title',
                    letterSpacing: 3,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 30,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
          mainButtontext = 'STOP';
          mainButtonColors = Colors.red;
          if (!isTimerComplete) {
            isTimerComplete = true;
            mainButtonColors = Colors.red; // Change the container color to green
            Future.delayed(Duration(seconds: 3), () {
              setState(() {
                mainButtontext = 'GO';
                mainButtonColors = Colors.green.shade800; // Reset the container color to red after 5 seconds
                isTimerComplete = false;
              });
            });
          }
        }
      });
    });
  }
  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  Widget buildTime() {
    return Column(
      children: [
        Text(
          seconds.toString().padLeft(2, '0'),
          style: TextStyle(
            color: Colors.deepOrange,
            fontSize: 50,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: 5,
        ),

      ],
    );
  }
}
