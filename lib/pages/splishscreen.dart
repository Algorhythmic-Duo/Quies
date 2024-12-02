import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quies/pages/homepage.dart';

class SplishScreen extends StatelessWidget {
  const SplishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Lottie.asset(
          'asset/Animation - 1714893541980.json',
        ),
      ),
      nextScreen: const HomePage(),
      duration: 3500,
      backgroundColor: const Color.fromARGB(255, 233, 18, 90),
      splashIconSize: 300.0,
    );
  }
}
