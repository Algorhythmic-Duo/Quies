part of 'button_bloc.dart';

sealed class ButtonEvent extends Equatable {
  const ButtonEvent();

  @override
  List<Object> get props => [];
}

class CorrectOption extends ButtonEvent {}

class WrongOption extends ButtonEvent {}
