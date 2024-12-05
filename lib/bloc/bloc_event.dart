part of 'bloc_bloc.dart';

sealed class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class FetchDocId extends BlocEvent {}

class CheckAns extends BlocEvent {}
