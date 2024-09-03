part of 'matrix_bloc.dart';

sealed class MatrixEvent extends Equatable {
  const MatrixEvent();
}

class MatrixInput extends MatrixEvent {
  final String input;

  const MatrixInput(this.input);

  @override
  List<Object> get props => [input];
}

class RotateMatrix extends MatrixEvent {
  @override
  List<Object?> get props => [];
}
