part of 'button_bloc.dart';

sealed class ButtonEvent extends Equatable {
  const ButtonEvent();

  @override
  List<Object> get props => [];
}

class FetchDocId extends ButtonEvent {}

class CorrectOption extends ButtonEvent {
  final int index;

  const CorrectOption(this.index);
}

class WrongOption extends ButtonEvent {
  final int index;

  const WrongOption(this.index);
}
