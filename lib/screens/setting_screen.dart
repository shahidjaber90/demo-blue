// import 'package:bluee/config.dart';

import 'package:blueee/screens/path_screen.dart';
import 'package:blueee/screens/setup_screen.dart';
import 'package:blueee/screens/sweep_screen.dart';
import 'package:flutter/material.dart';

import 'key_screen.dart';
import 'object_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color sweepColor = Colors.transparent;
  Color objectColor = Colors.transparent;
  Color pathColor = Colors.transparent;
  Color setupColor = Colors.transparent;
  Color nextColor = Colors.transparent;

  Color mainButtonColors = Colors.grey.shade800;

  String selectedOption = '';

  // @override
  // void initState() {
  //   super.initState();
  //
  //   objectOffset = Offset(350, 190);
  //   sweepOffset = Offset(350, 190);
  //   pathOffset = Offset(350, 190);
  //
  //   O variableO = O('', '', '');
  //
  //   objectPosy0 = 30;
  //   objectPosy1 = 30;
  //   objectPosy2 = 30;
  //   objectPosy3 = 30;
  //   objectPosy4 = 30;
  //   objectPosy5 = 30;
  //   objectPosy6 = 30;
  //   objectPosy7 = 30;
  //   objectPosy8 = 30;
  //   objectPosy9 = 30;
  //   objectPosy10 = 30;
  //
  //   pathPosy0 = 0.4;
  //   pathPosy1 = 0.4;
  //   pathPosy2 = 0.4;
  //   pathPosy3 = 0.4;
  //   pathPosy4 = 0.4;
  //   pathPosy5 = 0.4;
  //   pathPosy6 = 0.4;
  //   pathPosy7 = 0.4;
  //   pathPosy8 = 0.4;
  //   pathPosy9 = 0.4;
  //   pathPosy10 = 0.4;
  //
  //   sweepPosy1 = 0.4;
  //   sweepPosy2 = 0.4;
  //   sweepPosy3 = 0.4;
  //   sweepPosy4 = 0.4;
  //   sweepPosy5 = 0.4;
  //   sweepPosy6 = 0.4;
  //   sweepPosy7 = 0.4;
  //   sweepPosy8 = 0.4;
  //   sweepPosy9 = 0.4;
  //   sweepPosy10 = 0.4;
  //   sweepPosy0 = 0.4;
  // }

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
                                builder: (context) => const SetupScreen()));
                      },
                      child: Text(
                        '<',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w900,
                            fontSize: 35),
                      ),
                    ),
                  ),
                  const FittedBox(
                    child: Text(
                      'CHOOSE MODE',
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
                        setNextColor();
                        if (selectedOption == 'sweepScreen') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SweepScreen()));
                        } else if (selectedOption == 'objectScreen') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ObjectScreen()));
                        } else if (selectedOption == 'pathScreen') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PathScreen()));
                        }
                        else if(selectedOption=='keyScreen'){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KeyScreen()));
                        }
                        else {
                          print("choose the mode!");
                          // showToastMessage('Choose a mode!');
                        }
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
            SizedBox(height: screenHeight / 15),
            SizedBox(
              height: screenHeight / 5,
            ),
            Container(
              // width: screenWidth * 0.35,
              // height: screenHeight * 0.1,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade800),
                  primary: Colors.white,
                  backgroundColor: objectColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(300, 75),
                ),
                onPressed: () {
                  setObjectColor();
                  selectedOption = 'objectScreen';
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ObjectScreen()));
                },
                child: const FittedBox(
                  child: Text(
                    'OBJECT',
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
            Container(
              //width: screenWidth * 0.35,
              //height: screenHeight * 0.1,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade800),
                  primary: Colors.white,
                  backgroundColor: sweepColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(300, 75),
                ),
                onPressed: () {
                  setSweepColor();
                  selectedOption = 'sweepScreen';
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SweepScreen()));
                },
                child: const FittedBox(
                  child: Text(
                    'SWEEP',
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
            Container(
              // width: screenWidth * 0.35,
              //height: screenHeight * 0.1,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade800),
                  primary: Colors.white,
                  backgroundColor: pathColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(300, 75),
                ),
                onPressed: () {
                  setPathColor();
                  selectedOption = 'pathScreen';
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PathScreen()));
                },
                child: const FittedBox(
                  child: Text(
                    'PATH',
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
            Container(
              //width: screenWidth * 0.35,
              //height: screenHeight * 0.1,

              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade800),
                  primary: Colors.white,
                  backgroundColor: sweepColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(300, 75),
                ),
                onPressed: () {
                  setSweepColor();
                  selectedOption = 'keyScreen';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KeyScreen()));
                },
                child: const FittedBox(
                  child: Text(
                    'KEY',
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

  void setSweepColor() {
    setState(() {
      sweepColor = Colors.deepOrange;
      objectColor = Colors.transparent;
      pathColor = Colors.transparent;
      setupColor = Colors.transparent;
      nextColor = Colors.transparent;
    });
  }

  void setObjectColor() {
    setState(() {
      sweepColor = Colors.transparent;
      objectColor = Colors.deepOrange;
      pathColor = Colors.transparent;
      setupColor = Colors.transparent;
      nextColor = Colors.transparent;
    });
  }

  void setPathColor() {
    setState(() {
      sweepColor = Colors.transparent;
      objectColor = Colors.transparent;
      pathColor = Colors.deepOrange;
      setupColor = Colors.transparent;
      nextColor = Colors.transparent;
    });
  }

  void setNextColor() {
    setState(() {
      sweepColor = Colors.transparent;
      objectColor = Colors.transparent;
      pathColor = Colors.transparent;
      setupColor = Colors.transparent;
      nextColor = Colors.deepOrange;
    });
  }
}
