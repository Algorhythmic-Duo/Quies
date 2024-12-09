import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/Button/button_bloc.dart';
import 'package:quies/functions/colors.dart';
import 'package:quies/functions/sectionquiz.dart';
import 'package:quies/functions/timers.dart';
import 'package:quies/pages/endpage.dart';

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    _controller.forward();
    _controller.addStatusListener((sts) {
      if (sts == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EndPage(score: 0),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonBloc>(
      create: (context) => ButtonBloc()..add(FetchDocId()),
      child: Scaffold(
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
                      builder: (context) => const EndPage(score: 0),
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
          decoration: BoxDecoration(gradient: background),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TimerLoader(
                    controller: _controller,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
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
                  BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      if (state is BlocLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is BlocLoaded) {
                        return QuziSection(
                          score: state.count,
                          quslist: state.quslist,
                          usedIds: state.usedIds,
                          data: state.data,
                          color: state.color,
                        );
                      } else if (state is BlocError) {
                        return Center(
                          child: Text("Error: ${state.errormessage}"),
                        );
                      }
                      return QuziSection(
                        score: state.count,
                        quslist: state.quslist,
                        usedIds: state.usedIds,
                        data: state.data,
                        color: state.color,
                      ); // Return default values for other states
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
