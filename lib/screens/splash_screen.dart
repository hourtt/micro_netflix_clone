import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //TODO: Set the timer to move to Home screen after 4 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        //TODO: Use Littie.asset widget to use lottie file
        );
  }
}
