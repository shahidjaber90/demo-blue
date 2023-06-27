import 'package:blueee/variables/object_variable.dart';
import 'package:blueee/variables/path_val.dart';
import 'package:blueee/variables/sweep_variable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

O variableO = O('0', '0', '0', '0');
S variableS = S('0', '0', '0',  '0');
P varibleP = P('0', '0', '0', '0', '0');

void showToastMessage(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.deepOrange,
      textColor: Colors.white,
      fontSize: 20);
}

Offset objectOffset = const Offset(350, 205);
Offset sweepOffset = const Offset(350, 205);
Offset pathOffset = const Offset(350, 205);

double objectPosy0 = 0.4;
double objectPosy1 = 0.4;
double objectPosy2 = 0.4;
double objectPosy3 = 0.4;
double objectPosy4 = 0.4;
double objectPosy5 = 0.4;
double objectPosy6 = 0.4;
double objectPosy7 = 0.4;
double objectPosy8 = 0.4;
double objectPosy9 = 0.4;
double objectPosy10 = 0.4;

double pathPosy0 = 0.4;
double pathPosy1 = 0.4;
double pathPosy2 = 0.4;
double pathPosy3 = 0.4;
double pathPosy4 = 0.4;
double pathPosy5 = 0.4;
double pathPosy6 = 0.4;
double pathPosy7 = 0.4;
double pathPosy8 = 0.4;
double pathPosy9 = 0.4;
double pathPosy10 = 0.4;

double sweepPosy1 = 0.4;
double sweepPosy2 = 0.4;
double sweepPosy3 = 0.4;
double sweepPosy4 = 0.4;
double sweepPosy5 = 0.4;
double sweepPosy6 = 0.4;
double sweepPosy7 = 0.4;
double sweepPosy8 = 0.4;
double sweepPosy9 = 0.4;
double sweepPosy10 = 0.4;
double sweepPosy0 = 0.4;

double posx = 100.0;
double posy = 100.0;
bool visible = false;

double tosx = 100.0;
double tosy = 100.0;
bool secondLineVisible = false;

double posxPath = 100.0;
double posyPath = 100.0;
bool secondLineVisiblePath = false;
bool visiblityPath = false;
double tosxPath = 100.0;
double tosyPath = 100.0;

double posxObject = 0;
double posyObject = 0;
bool visibilityObject = false;
