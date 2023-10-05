import 'package:flutter/material.dart';
import 'package:personal_finance_manger/widgets/expenses.dart';

void main() {
  runApp(
   MaterialApp(

    theme: ThemeData(useMaterial3: true),
    home: const Expenses(),
     debugShowCheckedModeBanner: false,
  )
  );
}
