import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quies/bloc/bloc_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocBloc()..add(FetchDocId()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test Page'),
        ),
        body: BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) {
            if (state is BlocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BlocLoaded) {
              return ListView.builder(
                itemCount: state.docids.length,
                itemBuilder: (ctx, idx) {
                  return ListTile(
                    title: Text(state.docids[idx]),
                  );
                },
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
      ),
    );
  }
}
