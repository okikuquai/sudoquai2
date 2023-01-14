import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/number_buttons.dart';
import 'ui/sudoku_grid.dart';

void main() {
  runApp(const ProviderScope(child: SudoquaiApp()));
}

class SudoquaiApp extends StatelessWidget {
  const SudoquaiApp({super.key});
  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          home: Scaffold(
              appBar: AppBar(
                title: const Text('sudoquai2'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SudokuGrid(),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: InputNumberButtons(),
                  )
                ],
              )));
    });
  }
}
