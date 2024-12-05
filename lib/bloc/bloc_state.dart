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
  final Map<String, dynamic> data;
  final List<String> usedids;

  const BlocLoaded(this.docids, this.data, this.usedids);
}

class BlocError extends BlocState {
  final String errormessage;

  const BlocError(this.errormessage);
}
