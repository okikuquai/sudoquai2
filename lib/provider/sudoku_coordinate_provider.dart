import 'package:hooks_riverpod/hooks_riverpod.dart';

final SudokuCoordinateProvider = StateProvider((ref) => Coordinate(x: 0, y: 0));

class Coordinate {
  Coordinate({required this.x, required this.y});
  int x;
  int y;
}
