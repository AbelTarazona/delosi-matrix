part of 'matrix_bloc.dart';

sealed class MatrixState extends Equatable {
  const MatrixState();
}

final class MatrixInitial extends MatrixState {
  @override
  List<Object> get props => [];
}

class MatrixLoaded extends MatrixState {
  final Matrix matrix;

  const MatrixLoaded(this.matrix);

  @override
  List<Object> get props => [matrix];
}

class MatrixError extends MatrixState {
  final String message;

  const MatrixError(this.message);

  @override
  List<Object> get props => [message];
}