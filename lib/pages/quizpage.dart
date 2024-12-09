import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/Button/button_bloc.dart';
import 'package:quies/bloc/progressbar/progressbar_bloc.dart';
import 'package:quies/functions/colors.dart';
import 'package:quies/functions/sectionquiz.dart';
import 'package:quies/functions/timers.dart';
import 'package:quies/pages/endpage.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ButtonBloc>(
          create: (context) => ButtonBloc()..add(FetchDocId()),
        ),
        BlocProvider<ProgressbarBloc>(
          create: (context) => ProgressbarBloc(),
        ),
      ],
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
                  BlocListener<ProgressbarBloc, ProgressbarState>(
                    listener: (context, state) {
                      if (state is ProgressbarInitial) {
                        context.read<ProgressbarBloc>().add(StartProgress());
                      } else if (state is ProgressbarComplete) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EndPage(score: 0),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<ProgressbarBloc, ProgressbarState>(
                      builder: (context, state) {
                        if (state is ProgressbarInitial) {
                          return const CircularProgressIndicator(); // Show a loading indicator while initializing
                        } else if (state is ProgressbarLoading) {
                          return TimerLoader(values: state.progress);
                        } else if (state is ProgressbarComplete) {
                          return Container(); // Return an empty container when complete
                        }
                        return const TimerLoader(values: 0);
                      },
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
