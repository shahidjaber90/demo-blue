import 'package:blueee/screens/setup_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 90),
            const SizedBox(height: 80),
            const Text(
              'PROTOTYPE',
              style: TextStyle(color: Colors.white, fontSize: 50),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Connect battery and await bluetooth-connection',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetupScreen()));
              },
              child: Container(
                height: 150,
                child: Image.asset('assets/images/bluetoothimage.png'),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Password "000000"',
              style: TextStyle(color: Colors.deepOrange, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
