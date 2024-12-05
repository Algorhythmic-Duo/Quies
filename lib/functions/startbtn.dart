import 'package:flutter/material.dart';
import 'package:quies/pages/testpage.dart';

void startBtn(String namecontroller, BuildContext context) {
  if (namecontroller.isEmpty == true) {
    final warning = SnackBar(
      backgroundColor: Colors.red,
      content: const Text("Enter your name befor starting"),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(warning);
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TestPage(),
      ),
    );
  }
}