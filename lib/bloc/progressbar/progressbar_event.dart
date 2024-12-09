part of 'progressbar_bloc.dart';

sealed class ProgressbarEvent extends Equatable {
  const ProgressbarEvent();

  @override
  List<Object> get props => [];
}

class StartProgress extends ProgressbarEvent {}
