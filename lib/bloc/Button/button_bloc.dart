import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()) {
    on<CorrectOption>((event, emit) {});
  }
}
