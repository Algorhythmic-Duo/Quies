import 'package:flutter/material.dart';
import 'package:quies/pages/endpage.dart';

class TimerLoader extends StatelessWidget {
  final AnimationController controller;
  const TimerLoader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 10.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: Colors.white30,
              ),
            ),
            child: AnimatedBuilder(
                builder: (context, child) => LinearProgressIndicator(
                      value: controller.value,
                      borderRadius: BorderRadius.circular(100),
                      minHeight: 35,
                      color: const Color.fromARGB(255, 3, 206, 172),
                      backgroundColor: Colors.transparent,
                    ),
                animation: controller,
                child: EndPage(score: 0)),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              top: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.5),
                  child: Text(
                    "Timer",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Icon(
                  Icons.timer_outlined,
                  color: Colors.white70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
