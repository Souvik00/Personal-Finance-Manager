import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_manger/widgets/expenses_list/expenses_list.dart';
import 'package:personal_finance_manger/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  final List<Expense>_registeredExpenses = [
    Expense(
  tittle: 'Flutter',
  amount: 10.2,
  date: DateTime.now(),
  category: Catagory.work
  ),
  Expense(
  tittle: 'Cinema',
  amount: 1.2,
  date: DateTime.now(),
  category: Catagory.leisure
  ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
      children: [
        const Text('chart'),
       Expanded(
         child:  ExpensesList(expenses: _registeredExpenses),
       )
      ],
    ),
    );
  }
}