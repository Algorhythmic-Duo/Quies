part of 'progressbar_bloc.dart';

abstract class ProgressbarState extends Equatable {
  const ProgressbarState();

  @override
  List<Object> get props => [];
}

class ProgressbarInitial extends ProgressbarState {}

class ProgressbarLoading extends ProgressbarState {
  final double progress;

  const ProgressbarLoading(this.progress);

  @override
  List<Object> get props => [progress];
}

class ProgressbarComplete extends ProgressbarState {}
