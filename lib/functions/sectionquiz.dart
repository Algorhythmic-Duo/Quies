import 'package:flutter/material.dart';
import 'package:quies/functions/qustionpart.dart';

class QuziSection extends StatelessWidget {
  final List<String> usedIds;
  final VoidCallback onPresseds;
  final Map<String, dynamic> data;
  final List<Color> color;
  final List<String> quslist;
  const QuziSection(
      {super.key,
      required this.usedIds,
      required this.data,
      required this.color,
      required this.quslist,
      required this.onPresseds});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Question ${usedIds.length}/10",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 22.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 5.0,
          ),
          child: SizedBox(
            child: Text(
              data["Question"],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        ListView.builder(
          itemBuilder: (ctx, idx) {
            return QustionsPart(
              name: quslist[idx],
              onPressed: onPresseds,
              btnColor: color[idx],
            );
          },
          itemCount: 4,
        ),
      ],
    );
  }
}
