import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'progressbar_event.dart';
part 'progressbar_state.dart';

class ProgressbarBloc extends Bloc<ProgressbarEvent, ProgressbarState> {
  ProgressbarBloc() : super(ProgressbarInitial()) {
    on<ProgressbarEvent>((event, emit) async {
      const totalTime = 30;
      const interval = Duration(milliseconds: 100);
      double progress = 0.0;
      double increment = 1 / (totalTime * 10);
      Timer timer;
      timer = Timer.periodic(interval, (timer) {
        if (progress < 1.0) {
          progress += increment;
          add(_ProgressUpdate(progress));
        }
      });
    });
  }
}
