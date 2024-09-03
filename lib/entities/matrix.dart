import 'dart:math';

class Matrix {
  final List<List<int>> data;

  Matrix(this.data);

  factory Matrix.fromString(String input) {
    final cleanInput = input.replaceAll(RegExp(r'[\[\]\s]'), '');
    final numbers = cleanInput.split(',').map(int.parse).toList();
    final size = sqrt(numbers.length).round();

    if (size * size != numbers.length) {
      throw FormatException('Lo ingresado no forma un cuadrado');
    }

    return Matrix(
      List.generate(
        size,
            (i) => numbers.sublist(i * size, (i + 1) * size),
      ),
    );
  }

  Matrix rotateAntiClockwise() {
    final n = data.length;
    final rotated = List.generate(n, (_) => List<int>.filled(n, 0));

    for (var i = 0; i < n; i++) {
      for (var j = 0; j < n; j++) {
        rotated[n - j - 1][i] = data[i][j];
      }
    }

    return Matrix(rotated);
  }

  @override
  String toString() {
    return data.map((row) => row.join(', ')).join('\n');
  }
}