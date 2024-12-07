part of 'bloc_bloc.dart';

sealed class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

class BlocInitial extends BlocState {}

class BlocLoading extends BlocState {}

class BlocLoaded extends BlocState {
  final List<String> docids;

  const BlocLoaded(this.docids);

  @override
  List<Object> get props => [docids];
}

class BlocError extends BlocState {
  final String errormessage;

  const BlocError(this.errormessage);

  @override
  List<Object> get props => [errormessage];
}
