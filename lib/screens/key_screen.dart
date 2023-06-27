import  'package:blueee/config.dart';
import 'package:blueee/go_page/go_object.dart';
import 'package:blueee/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bluetooth_api/bluetooth_api.dart';
import '../settings_circles/key_circle.dart';

class KeyScreen extends StatefulWidget {
  @override
  State<KeyScreen> createState() => _KeyScreenState();
}

double Speed = 0;
double DynamicSlow = 0;

class _KeyScreenState extends State<KeyScreen> {
  BlueToothApi blue = BlueToothApi();

  Color mainButtonColors = Colors.grey.shade800;

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
                  //SizedBox(width: screenWidth/15),

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
                      'Key',
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
                                builder: (context) => GoObjectPage()));
                      },
                      child: FittedBox(
                        child: Text(
                          '>',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 35,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight / 30),
            Container(
              //height: 270.0,
              //width: 300.0,
              width: screenWidth * 0.95, //preferred 0,95
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                //color: Colors.grey.shade400,
                //borderRadius: BorderRadius.circular(15),
                //shape: BoxShape.rectangle
              ),
              child: KeyCircle(),
            ),
            SizedBox(height: screenHeight / 30),
            const Text(
              '0 m - Object slow - 5 m',
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
                max: 5,
                divisions: 5,
                activeColor: Colors.deepOrange,
                value: DynamicSlow,
                onChanged: (value) {
                  setState(() {
                    DynamicSlow = value;
                  });
                  print(DynamicSlow);
                  variableO.D = DynamicSlow.toStringAsFixed(0);
                },
              ),
            ),
            const Text(
              'min - Speed - max',
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
                max: 200,
                divisions: 200,
                activeColor: Colors.deepOrange,
                value: Speed,
                onChanged: (value) {
                  setState(() {
                    Speed = value;
                  });
                  print(Speed);
                  variableO.L = Speed.toStringAsFixed(0);
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
                      "OBJECT_SETTINGS::${variableO.X}::${variableO.Y}::${variableO.L}::${variableO.D}");

                  showToastMessage('OBJECT settings uploaded!');
                  print(
                      'O :: X = ${variableO.X} Y = ${variableO.Y} L = ${variableO.L} D = ${variableO.D}');
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
