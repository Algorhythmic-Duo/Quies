part of 'progressbar_bloc.dart';

sealed class ProgressbarState extends Equatable {
  const ProgressbarState();

  @override
  List<Object> get props => [];
}

final class ProgressbarInitial extends ProgressbarState {}

final class ProgressbarUpdate extends ProgressbarState {
  final double progress;
  const ProgressbarUpdate(this.progress);
}

final class ProgressbarCompleted extends ProgressbarState {}
