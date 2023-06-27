import 'package:blueee/bluetooth_api/bluetooth_api.dart';
import 'package:blueee/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../go_page/go_path.dart';
import '../settings_circles/path_circle.dart';

class PathScreen extends StatefulWidget {
  @override
  State<PathScreen> createState() => _PathScreenState();
}

double slidervalue = 0;

class _PathScreenState extends State<PathScreen> {
  Color mainButtonColors = Colors.grey.shade800;
  BlueToothApi blue = BlueToothApi();

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
                                builder: (context) => SettingScreen()));
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
                      'PATH',
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
                                builder: (context) => GoPathPage()));
                      },
                      child: FittedBox(
                        child: Text(
                          '>',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w900,
                              fontSize: 35),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 35),
            Container(
              //height: 270.0,
              //width: 300.0,
              width: screenWidth * 0.95, //preferred 0,95
              height: screenHeight * 0.4,
              //width: screenWidth * 0.7,
              //height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                  // color: Colors.grey,
                  //shape: BoxShape.circle
                  ),
              child: PathCircle(),
            ),
            SizedBox(height: screenHeight / 6.5),
            const Text(
              'min - SPEED - max',
              style: TextStyle(
                  letterSpacing: 3,
                  fontFamily: 'Title',
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 15),
            ),
            SizedBox(height: screenHeight / 100),
            Container(
              width: 250,
              child: CupertinoSlider(
                min: 0,
                max: 30,
                divisions: 30,
                activeColor: Colors.deepOrange,
                value: slidervalue,
                onChanged: (value) {
                  setState(() {
                    slidervalue = value;
                  });
                  print(slidervalue);
                  variableO.L = slidervalue.toString();
                },
              ),
            ),
            SizedBox(height: screenHeight / 50),
            Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.transparent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  primary: Colors.white,
                  backgroundColor: mainButtonColors,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(300, 75),
                ),
                onPressed: () {
                  blue.write(
                      "PATH_SETTINGS::${varibleP.x1}::${varibleP.y1}::${varibleP.x2}::${varibleP.y2}::${varibleP.L}");
                  //showToastMessage("${varibleP.x1}::${varibleP.y1}::${varibleP.x2}::${varibleP.y2}::${varibleP.L}");
                  showToastMessage('PATH settings uploaded!');
                  //print('P :: x1 = ${varibleP.x1} y1 = ${varibleP.y1} x2 = ${varibleP.x2} y2 = ${varibleP.y2} L = 11');
                },
                child: const FittedBox(
                  child: Text(
                    'UPLOAD',
                    style: TextStyle(
                        letterSpacing: 3,
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 60,
            ),
          ],
        ),
      ),
    );
  }
}
