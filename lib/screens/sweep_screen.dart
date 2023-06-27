import 'package:blueee/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bluetooth_api/bluetooth_api.dart';
import '../config.dart';
import '../go_page/go_sweep.dart';
import '../settings_circles/sweep_circle.dart';
import 'another_check.dart';

class SweepScreen extends StatefulWidget {
  @override
  State<SweepScreen> createState() => _SweepScreenState();
}

double slidervalue = 0;

class _SweepScreenState extends State<SweepScreen> {
  BlueToothApi blue = BlueToothApi();

  Color mainButtonColors = Colors.grey.shade800;
  Color leftColor = Colors.transparent;
  Color rightColor = Colors.transparent;
  String switchValue = '0';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight / 25,
          ),
          Container(
            color: Colors.deepOrange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(width: screenWidth/15,),

                Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(width: 1, color: Colors.transparent),
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
                    'SWEEP',
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
                      side:
                          const BorderSide(width: 1, color: Colors.transparent),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoSweepPage()));
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
          SizedBox(height: screenHeight / 30),

          Container(
            //height: 270.0,
            //width: 300.0,

            width: screenWidth * 0.95, //preferred 0,95
            // height: screenHeight * 0.4, //0,4
            decoration: const BoxDecoration(
                // color: Colors.green,
                //color: Colors.grey,
                shape: BoxShape.circle),
            child: Container(
              width: screenWidth * 0.95, //preferred 0,95
              // height: screenHeight * 0.4, //0,4
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade800),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 35),
                  SizedBox(
                      width: screenWidth * 0.95, //preferred 0,95
                      height: screenHeight * 0.4, //0,4
                      child: MyWidgett()),
                  SizedBox(height: screenHeight / 35),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: variableS.D == '1'
                              ? Colors.deepOrange
                              : Colors.white,
                          side: BorderSide(
                            width: 1,
                            color: Colors.grey.shade800,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(135, 75),
                        ),
                        onPressed: () {
                          setState(() {
                            variableS.D = variableS.D == '1' ? '0' : '1';
                            print("Value is ${variableS.D}");
                          });
                        },
                        child: Icon(
                          Icons.rotate_left_rounded,
                          size: 50,
                          color: variableS.D == '0'
                              ? Colors.deepOrange
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 35),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight / 100), //15

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
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
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
                    "SWEEP_SETTINGS::${variableS.angleA}::${variableS.angleb}::${variableS.L}::${variableS.D}");

                showToastMessage('SWEEP settings uploaded!');
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
    );
  }
}
