import 'package:flutter/material.dart';
import 'package:personal_finance_manger/widgets/expenses.dart';

void main() {
  runApp(
   MaterialApp(

    theme: ThemeData().copyWith(
        useMaterial3:true,
        scaffoldBackgroundColor: Color.fromARGB(255, 71, 28, 114)),
    home: const Expenses(),
     debugShowCheckedModeBanner: false,
  )
  );
}
