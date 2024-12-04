import 'package:flutter/material.dart';
import 'package:quies/pages/endpage.dart';
import 'package:quies/pages/parts/qustionpart.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndPage(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 175, 0, 108),
              Color.fromARGB(255, 204, 4, 127),
              Color.fromARGB(255, 241, 15, 155),
              Color.fromARGB(255, 255, 68, 183),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
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
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(100),
                          minHeight: 35,
                          color: const Color.fromARGB(255, 3, 206, 172),
                          backgroundColor: Colors.transparent,
                        ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage('asset/whale.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Question 1/10",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 5.0,
                  ),
                  child: SizedBox(
                    child: Text(
                      "This is the qustion",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                QustionsPart(name: "a1"),
                QustionsPart(name: "a2"),
                QustionsPart(name: "a3"),
                QustionsPart(name: "a4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
