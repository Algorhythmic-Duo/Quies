import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/starting/bloc_bloc.dart';
import 'package:quies/functions/colors.dart';
import 'package:quies/pages/endpage.dart';
import 'package:quies/pages/parts/qustionpart.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocBloc()..add(FetchDocId()),
      child: BlocBuilder<BlocBloc, BlocState>(
        builder: (context, state) {
          if (state is BlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlocLoaded) {
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
                decoration: BoxDecoration(gradient: background),
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
                                  value: 10,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                "Question ${state.usedids.length}/10",
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
                                  state.data["Question"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            QustionsPart(
                              name: state.data["Option1"],
                              onPressed: () {
                                if (state.data["Option1"] ==
                                    state.data["correctAns"]) {
                                } else {}
                              },
                            ),
                            QustionsPart(
                              name: state.data["Option2"],
                              onPressed: () {
                                if (state.data["Option2"] ==
                                    state.data["correctAns"]) {
                                } else {}
                              },
                            ),
                            QustionsPart(
                              name: state.data["Option3"],
                              onPressed: () {
                                if (state.data["Option3"] ==
                                    state.data["correctAns"]) {
                                } else {}
                              },
                            ),
                            QustionsPart(
                              name: state.data["correctAns"],
                              onPressed: () {
                                if (state.data["correctAns"] ==
                                    state.data["correctAns"]) {
                                } else {}
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is BlocError) {
            return Center(
              child: Text("Error: ${state.errormessage}"),
            );
          }
          return const Center(
            child: Text("No data"),
          );
        },
      ),
    );
  }
}
