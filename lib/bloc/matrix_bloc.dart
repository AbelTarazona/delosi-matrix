import 'package:bloc/bloc.dart';
import 'package:delosi/entities/matrix.dart';
import 'package:equatable/equatable.dart';

part 'matrix_event.dart';
part 'matrix_state.dart';

class MatrixBloc extends Bloc<MatrixEvent, MatrixState> {
  MatrixBloc() : super(MatrixInitial()) {
    on<MatrixInput>(_onMatrixInput);
    on<RotateMatrix>(_onRotateMatrix);
  }

  void _onMatrixInput(MatrixInput event, Emitter<MatrixState> emit) {
    try {
      final matrix = Matrix.fromString(event.input);
      emit(MatrixLoaded(matrix));
    } catch (e) {
      emit(MatrixError(e.toString()));
    }
  }

  void _onRotateMatrix(RotateMatrix event, Emitter<MatrixState> emit) {
    if (state is MatrixLoaded) {
      final currentMatrix = (state as MatrixLoaded).matrix;
      final rotatedMatrix = currentMatrix.rotateAntiClockwise();
      emit(MatrixLoaded(rotatedMatrix));
    }
  }
}