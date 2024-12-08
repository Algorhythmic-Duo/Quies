import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/starting/bloc_bloc.dart';
import 'package:quies/pages/homepage.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> datalist = [];
    return BlocProvider(
      create: (context) => BlocBloc()..add(FetchDocId()),
      child: BlocBuilder<BlocBloc, BlocState>(
        builder: (context, state) {
          if (state is BlocLoading) {
            return HomePage(dataList: datalist);
          } else if (state is BlocLoaded) {
            datalist = state.docids;
            return HomePage(dataList: state.docids);
          } else if (state is BlocError) {
            return Center(
              child: Text("Error: ${state.errormessage}"),
            );
          }
          return Center(
            child: HomePage(dataList: datalist),
          );
        },
      ),
    );
  }
}
