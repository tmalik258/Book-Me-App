import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to login screen after a delay
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black, // Set background color
    body: SizedBox.expand( // Make the image cover the entire screen
      child: FittedBox(
        fit: BoxFit.cover, // Cover the entire screen with the image
        child: Image.asset('assets/splash.gif'),
    ),
    ),
  );
  }
}
