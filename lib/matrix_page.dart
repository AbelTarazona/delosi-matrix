import 'package:delosi/bloc/matrix_bloc.dart';
import 'package:delosi/widgets/custom_toast.dart';
import 'package:delosi/widgets/matrix_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatrixPage extends StatelessWidget {
  MatrixPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotación de Matriz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingrese la matriz (ej., [[1,2],[3,4]])',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<MatrixBloc>().add(MatrixInput(_controller.text));
              },
              child: const Text('Generar Matriz'),
            ),
            const SizedBox(height: 16),
            BlocConsumer<MatrixBloc, MatrixState>(
              listener: (context, state) {
                if (state is MatrixError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is MatrixLoaded) {
                  return Column(
                    children: [
                      MatrixDisplay(matrix: state.matrix),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final previousMatrix = state.matrix.toString();
                          context.read<MatrixBloc>().add(RotateMatrix());
                          showToast(context, 'Previo matriz:\n$previousMatrix');
                        },
                        child: const Text('Rotar'),
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
