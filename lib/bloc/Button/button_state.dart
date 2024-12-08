part of 'button_bloc.dart';

sealed class ButtonState extends Equatable {
  final List<Color> color;
  final int count;
  final List<String> docIds;
  final List<String> usedIds;
  final Map<String, dynamic> data;
  final List<String> quslist;
  const ButtonState(this.color, this.count, this.docIds, this.usedIds,
      this.data, this.quslist);

  @override
  List<Object> get props => [];
}

final class ButtonInitial extends ButtonState {
  ButtonInitial()
      : super([startColor, startColor, startColor, startColor], 0, [], [], {},
            []);
}

final class ColorChange extends ButtonState {
  const ColorChange(super.newColor, super.newcount, super.docIds, super.usedIds,
      super.data, super.quslist);
}

final class QustionChange extends ButtonState {
  QustionChange(Map<String, dynamic> data, int count, List<String> docIds,
      List<String> usedIds, List<String> quslist)
      : super([startColor, startColor, startColor, startColor], count, docIds,
            usedIds, data, quslist);
}

class BlocLoading extends ButtonState {
  BlocLoading()
      : super([startColor, startColor, startColor, startColor], 0, [], [], {},
            []);
}

class BlocLoaded extends ButtonState {
  BlocLoaded(Map<String, dynamic> data, int count, List<String> docIds,
      List<String> usedIds, List<String> quslist)
      : super([startColor, startColor, startColor, startColor], count, docIds,
            usedIds, data, quslist);
}

class BlocError extends ButtonState {
  final String errormessage;

  BlocError(this.errormessage)
      : super([startColor, startColor, startColor, startColor], 0, [], [], {},
            []);

  @override
  List<Object> get props => [errormessage];
}
