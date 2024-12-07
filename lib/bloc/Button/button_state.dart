part of 'button_bloc.dart';

sealed class ButtonState extends Equatable {
  const ButtonState();
  
  @override
  List<Object> get props => [];
}

final class ButtonInitial extends ButtonState {}
