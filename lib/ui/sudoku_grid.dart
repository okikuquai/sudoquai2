import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/sudoku_coordinate_provider.dart';
import '../provider/sudoku_gridvalue_provider.dart';

class SudokuGrid extends HookConsumerWidget {
  const SudokuGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCoordinateState = ref.watch(SudokuCoordinateProvider);
    final selectedCoordinateStateNotifer =
        ref.watch(SudokuCoordinateProvider.notifier);
    final sudokuGritValuesState = ref.watch(SudokuGritValuesNotifierProvider);

    void _setCoordinate(int x, int y) {
      selectedCoordinateStateNotifer.state = Coordinate(x: x, y: y);
    }

    Color _backColor(int x, int y) {
      if (x == selectedCoordinateState.x && y == selectedCoordinateState.y) {
        return Theme.of(context).colorScheme.secondary.withOpacity(0.2);
      }

      return Colors.transparent;
    }

    return Stack(
      children: [
        const Center(
            child: SizedBox(
                width: 360,
                height: 360,
                child: GridPaper(
                  color: Colors.black,
                  divisions: 1,
                  interval: 120,
                  subdivisions: 3,
                ))),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < 9; i++) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = 0; j < 9; j++) ...{
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: _backColor(j, i),
                        ),
                        onPressed: () => _setCoordinate(j, i),
                        child: Text(sudokuGritValuesState[j][i]),
                      ))
                }
              ],
            )
          }
        ])
      ],
    );
  }
}
