import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/Button/button_bloc.dart';
import 'package:quies/functions/qustionpart.dart';
import 'package:quies/pages/endpage.dart';

class QuziSection extends StatelessWidget {
  final List<String> usedIds;
  final int score;
  final Map<String, dynamic> data;
  final List<Color> color;
  final List<String> quslist;

  const QuziSection({
    super.key,
    required this.usedIds,
    required this.data,
    required this.color,
    required this.quslist,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
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
          child: Text(
            data["Question"],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, idx) {
            return QustionsPart(
              name: quslist[idx],
              onPressed: () {
                if (usedIds.length == 10) {
                  if (quslist[idx] == data["correctAns"]) {
                    context.read<ButtonBloc>().add(CorrectOption(idx));
                  } else {
                    context.read<ButtonBloc>().add(WrongOption(idx));
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndPage(score: score)));
                } else {
                  if (quslist[idx] == data["correctAns"]) {
                    context.read<ButtonBloc>().add(CorrectOption(idx));
                  } else {
                    context.read<ButtonBloc>().add(WrongOption(idx));
                  }
                }
              },
              btnColor: color[idx],
            );
          },
          itemCount: 4,
        ),
      ],
    );
  }
}
