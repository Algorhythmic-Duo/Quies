import 'package:flutter/material.dart';
import 'package:quies/pages/homepage.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(
                    image: AssetImage('asset/viking.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: ListTile(
                title: Text(
                  "Your Scored 1/10",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 206, 172)),
                    foregroundColor:
                        WidgetStatePropertyAll<Color>(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text("Done"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
