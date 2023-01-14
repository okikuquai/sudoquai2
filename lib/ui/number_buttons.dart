import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/sudoku_coordinate_provider.dart';
import '../provider/sudoku_gridvalue_provider.dart';

class InputNumberButtons extends HookConsumerWidget {
  const InputNumberButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridValueStateNotifier =
        ref.watch(SudokuGritValuesNotifierProvider.notifier);

    final gridCoordinateState = ref.watch(SudokuCoordinateProvider);
    return Column(children: [
      Column(
        children: [
          for (int i = 1; i < 9; i += 3) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int j = i; j < i + 3; j++) ...{
                  TextButton(
                      onPressed: () => gridValueStateNotifier.setValue(
                          gridCoordinateState.x, gridCoordinateState.y, j),
                      child: _textButtonStyle(j.toString()))
                }
              ],
            )
          },
        ],
      ),
      TextButton(
          onPressed: () => gridValueStateNotifier.setValue(
              gridCoordinateState.x, gridCoordinateState.y, -1),
          child: _textButtonStyle('Clear'))
    ]);
  }

  Widget _textButtonStyle(String str) {
    return SizedBox(
        width: 90,
        height: 30,
        child: Text(
          str,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ));
  }
}
