part of 'progressbar_bloc.dart';

abstract class ProgressbarEvent extends Equatable {
  const ProgressbarEvent();

  @override
  List<Object> get props => [];
}

class StartProgress extends ProgressbarEvent {}
