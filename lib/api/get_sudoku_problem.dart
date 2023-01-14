import 'package:dio/dio.dart';

Future<List<SudokuSquare>?> getSudokuProblem(String difficult) async {
  try {
    var res =
        await Dio().get(const String.fromEnvironment('API_URL') + difficult);
    if (res.statusCode == 200 && res.data != null) {
      try {
        final data = res.data! as List<dynamic>;

        return <SudokuSquare>[];
        // return data.map((e) => SudokuSquare(x: e['DedaultValue'])).toList();
      } catch (e) {
        print(e);
      }
    }
  } catch (e) {
    print(e);
  }
  return <SudokuSquare>[];
}

class SudokuSquare {
  SudokuSquare(
      {required this.x,
      required this.y,
      required this.isInitial,
      required this.value});
  final int x;
  final int y;
  final bool isInitial;
  final int value;
}
