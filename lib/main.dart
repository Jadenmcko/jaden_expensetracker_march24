import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 164, 71, 118));
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal, color: kColorScheme.onSecondaryContainer, fontSize: 18,
        )
      ),
      colorScheme: kColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: kColorScheme.onPrimaryContainer, 
      foregroundColor: kColorScheme.primaryContainer,),
      cardTheme: CardThemeData(
        color: kColorScheme.secondaryContainer, 
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: kColorScheme.primaryContainer))),
    home: Expenses()
    ),
  );
}
