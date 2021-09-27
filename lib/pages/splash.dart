import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sipantau_covid/navigations/bottom_navigation.dart';
import 'package:sipantau_covid/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.coronavirus,
                color: primaryColor,
                size: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'SiPantau Covid',
                style: titleText,
              ),
              Text(
                'Pantau Covid-19 Global & Indonesia',
                style: subtitleText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
