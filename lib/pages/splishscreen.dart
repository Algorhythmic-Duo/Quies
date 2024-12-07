import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quies/pages/startingpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'asset/Animation - 1714893541980.json',
        ),
      ),
      nextScreen: const StartingPage(),
      duration: 2000,
      backgroundColor: const Color.fromARGB(255, 233, 18, 90),
      splashIconSize: 300.0,
    );
  }
}
