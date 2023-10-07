import 'package:flutter/material.dart';
import 'package:personal_finance_manger/widgets/expenses.dart';
var colorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var darkcolorscheme=ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor: const Color.fromARGB(
    255, 4, 4, 33));
void main() {
  runApp(
   MaterialApp(
  darkTheme: ThemeData.dark().copyWith(
    useMaterial3:true,
    colorScheme: darkcolorscheme,
    cardTheme: const CardTheme().copyWith(
      color:darkcolorscheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 16,
          vertical: 8),
    ),

  ),
    theme: ThemeData().copyWith(
        useMaterial3:true,

        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorScheme.onPrimaryContainer,
      foregroundColor: colorScheme.primaryContainer,

    ),
      cardTheme: const CardTheme().copyWith(
        color:colorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16,
            vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor : darkcolorscheme.primaryContainer,
          foregroundColor: darkcolorscheme.onPrimaryContainer,
        ),

      ),
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSecondaryContainer,
          fontSize: 20,
        ),

      )
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
     debugShowCheckedModeBanner: false,
  )
  );
}
