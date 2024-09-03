import 'package:delosi/entities/matrix.dart';
import 'package:flutter/material.dart';

class MatrixDisplay extends StatelessWidget {
  final Matrix matrix;

  const MatrixDisplay({super.key, required this.matrix});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: matrix.data.map((row) {
        return TableRow(
          children: row.map((cell) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(cell.toString()),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}