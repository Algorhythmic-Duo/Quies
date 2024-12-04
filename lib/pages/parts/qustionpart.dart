import 'package:flutter/material.dart';

class QustionsPart extends StatelessWidget {
  final String name;
  const QustionsPart({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5.0,
        bottom: 20.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
