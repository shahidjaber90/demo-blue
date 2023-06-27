import 'package:blueee/bluetooth_api/bluetooth_api.dart';
import 'package:blueee/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  Color smallCirclesColorA = Colors.transparent;
  Color smallCirclesColorB = Colors.transparent;

  Color arrowColorOne = Colors.deepOrange;
  Color arrowColorTwo = Colors.deepOrange;
  Color arrowColorThree = Colors.deepOrange;
  Color arrowColorFour = Colors.deepOrange;

  Color arrowButtonBackOne = Colors.transparent;
  Color arrowButtonBackTwo = Colors.transparent;
  Color arrowButtonBackThree = Colors.transparent;
  Color arrowButtonBackFour = Colors.transparent;

  Color mainButtonColors = Colors.grey.shade400;
  Color frame = Colors.grey.shade800;

  int count = 0;

  BlueToothApi blue = BlueToothApi();

  bool animatedPositionalWidgetVisibility = false;
  double animatedPositionalWidgetHeight = 0;
  double donePositionalWidgetHeight = 0;
  bool okButtonClicked = false;

  Color oneBorderColor = Colors.deepOrange;
  Color twoBorderColor = Colors.grey;
  Color threeBorderColor = Colors.grey;
  Color aCircleColor = Colors.white;
  Color bCircleColor = Colors.white;
  Color oneTextColor = Colors.deepOrange;
  Color twoTextColor = Colors.grey;
  Color threeTextColor = Colors.grey;
  Color aTextColor = Colors.grey;
  Color bTextColor = Colors.grey;
  Color upArrowColor = Colors.deepOrange.shade100;
  Color downArrowColor = Colors.deepOrange.shade100;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight / 25),
                ColoredBox(
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
                                borderRadius: BorderRadius.circular(18)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
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
                      const Text(
                        'END POINTS',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontFamily: 'Title',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      OutlinedButton(
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
                            '>',
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w900,
                                fontSize: 35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight / 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (oneBorderColor == Colors.deepOrange) {
                            setState(() {
                              if (animatedPositionalWidgetVisibility == true) {
                                animatedPositionalWidgetVisibility = false;
                                animatedPositionalWidgetHeight = 0;
                              } else {
                                animatedPositionalWidgetVisibility = true;
                                animatedPositionalWidgetHeight =
                                    screenHeight / 1.5;
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 40, color: oneTextColor),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: oneBorderColor, width: 4)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (twoBorderColor == Colors.deepOrange) {
                            setState(() {
                              if (animatedPositionalWidgetVisibility == true) {
                                animatedPositionalWidgetVisibility = false;
                                animatedPositionalWidgetHeight = 0;
                              } else {
                                animatedPositionalWidgetVisibility = true;
                                animatedPositionalWidgetHeight =
                                    screenHeight / 1.5;
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 40, color: twoTextColor),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: twoBorderColor, width: 4)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (threeBorderColor == Colors.deepOrange) {
                            setState(() {
                              if (animatedPositionalWidgetVisibility == true) {
                                animatedPositionalWidgetVisibility = false;
                                animatedPositionalWidgetHeight = 0;
                              } else {
                                animatedPositionalWidgetVisibility = true;
                                animatedPositionalWidgetHeight =
                                    screenHeight / 1.5;
                              }
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '3',
                            style:
                                TextStyle(fontSize: 40, color: threeTextColor),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: threeBorderColor, width: 4)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'A',
                          style: TextStyle(fontSize: 40, color: aTextColor),
                        ),
                        decoration: BoxDecoration(
                            color: aCircleColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 4)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 1,
                        width: screenWidth / 1.8,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey, width: 4)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'B',
                          style: TextStyle(fontSize: 40, color: bTextColor),
                        ),
                        decoration: BoxDecoration(
                            color: bCircleColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 4)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: screenHeight / 10,
                      width: screenWidth / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 4)),
                      child: GestureDetector(
                        onTap: () {
                          if (twoTextColor == Colors.deepOrange) {
                            print('clicked on up arrow');
                            setState(() {
                              twoTextColor = Colors.grey;
                              twoBorderColor = Colors.grey;
                              threeTextColor = Colors.deepOrange;
                              threeBorderColor = Colors.deepOrange;
                              downArrowColor = Colors.deepOrange;
                            });
                          }
                        },
                        child: ImageIcon(
                          const AssetImage("assets/images/icon/arrowUp.png"),
                          color: upArrowColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: screenHeight / 10,
                      width: screenWidth / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 4)),
                      child: ImageIcon(
                        const AssetImage("assets/images/icon/arrowDown.png"),
                        color: downArrowColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight / 15,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.transparent),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 12),
                    primary: Colors.white,
                    backgroundColor: mainButtonColors,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(300, 75),
                  ),
                  onPressed: () {
                    if (oneBorderColor == Colors.deepOrange) {
                      setState(() {
                        oneBorderColor = Colors.grey;
                        oneTextColor = Colors.grey;
                        twoBorderColor = Colors.deepOrange;
                        twoTextColor = Colors.deepOrange;
                        upArrowColor = Colors.deepOrange;
                        aTextColor = Colors.white;
                        aCircleColor = Colors.green;
                      });
                    } else if (twoBorderColor == Colors.deepOrange) {
                      setState(() {
                        twoBorderColor = Colors.grey;
                        twoTextColor = Colors.grey;
                        threeTextColor = Colors.deepOrange;
                        threeBorderColor = Colors.deepOrange;
                      });
                    } else if (threeBorderColor == Colors.deepOrange) {
                      setState(() {
                        bTextColor = Colors.white;
                        bCircleColor = Colors.green;
                        donePositionalWidgetHeight = screenHeight / 1.6;
                      });
                    }
                    // count = count + 1;
                    // print('count :: $count');
                    // if (count == 1) {
                    //   blue.write("SET");
                    //   setState(() {
                    //     smallCirclesColorA = Colors.green;
                    //   });
                    // } else if (count == 2) {
                    //   blue.write("SET");
                    //   setState(() {
                    //     smallCirclesColorB = Colors.green;
                    //   });
                    // } else {
                    //   print('count is greater than 2');
                    // }
                  },
                  child: const FittedBox(
                    child: Text(
                      'SET',
                      style: TextStyle(
                          letterSpacing: 3,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 200,
                ),
                SizedBox(
                  height: screenWidth * 0.06,
                ),
              ],
            ),
          ),
          AnimatedPositioned(
              height: animatedPositionalWidgetHeight,
              bottom: 5,
              left: 5,
              right: 5,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Visibility(
                    visible: animatedPositionalWidgetVisibility,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.deepOrange, width: 2)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Picture & text',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            okButtonClicked
                                ? Padding(
                                    padding: EdgeInsets.all(screenHeight / 14),
                                    child: Icon(
                                      Icons.check_circle,
                                      size: screenHeight / 3,
                                      color: Colors.green,
                                    ),
                                  )
                                : SizedBox(
                                    height: screenHeight / 2.1,
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    print('ok pressed');
                                    if (okButtonClicked == false) {
                                      setState(() {
                                        okButtonClicked = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      setState(() {
                                        animatedPositionalWidgetHeight = 0;
                                      });

                                      okButtonClicked = false;
                                    }
                                    if (threeBorderColor == Colors.deepOrange) {
                                      setState(() {
                                        bCircleColor = Colors.green;
                                        bTextColor = Colors.white;
                                      });
                                    }
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                    animatedPositionalWidgetVisibility = false;
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            )
                          ],
                        )),
                  )),
              duration: const Duration(seconds: 1)),
          AnimatedPositioned(
              height: donePositionalWidgetHeight,
              bottom: 5,
              left: 5,
              right: 5,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.deepOrange, width: 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenHeight / 14),
                            child: Icon(
                              Icons.check_circle,
                              size: screenHeight / 3,
                              color: Colors.green,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  print('ok pressed');
                                  if (okButtonClicked == false) {
                                    setState(() {
                                      okButtonClicked = true;
                                    });
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                    setState(() {
                                      animatedPositionalWidgetHeight = 0;
                                      animatedPositionalWidgetVisibility =
                                          false;
                                    });
                                    okButtonClicked = false;
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      donePositionalWidgetHeight = 0;
                                    });
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      ))),
              duration: const Duration(seconds: 1)),
        ],
      ),
    );
  }
}
