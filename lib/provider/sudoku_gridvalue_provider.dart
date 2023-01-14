import 'package:hooks_riverpod/hooks_riverpod.dart';

final SudokuGritValuesNotifierProvider =
    StateNotifierProvider<SudokuGritValuesNotifier, List<List<String>>>(
  (ref) => SudokuGritValuesNotifier(),
);

class SudokuGritValuesNotifier extends StateNotifier<List<List<String>>> {
  SudokuGritValuesNotifier()
      : super(List.generate(9, (_) => List.generate(9, (_) => '')));

  void setValue(int x, int y, int value) {
    // state = SudokuLogic.setValue(x, y, value);
  }

  void allClear() {
    // SudokuLogic.allClear();
    // state = SudokuLogic.currentSudokuGridValues;
  }
}
