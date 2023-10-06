
import 'package:flutter/material.dart';
import 'package:personal_finance_manger/widgets/expenses_list/expenses_list.dart';
import 'package:personal_finance_manger/models/expense.dart';
import 'package:personal_finance_manger/widgets/new_expense.dart';

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
  void _openAdExpenseOverlay(){
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            builder: (ctx)=> NewExpense(onAddExpense: _addExpense),
        );
  }
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
   final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          duration:const Duration(seconds: 5),
            content: const Text('Expense Deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: (){
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('NO Expenses found,Start adding some'),
    );
    if(_registeredExpenses.isNotEmpty){
      mainContent=ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense:_removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses Tracker'),
        actions: [
          IconButton(onPressed: _openAdExpenseOverlay,
              icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:Column(
      children: [
        const Text('chart'),
       Expanded(
         child:  mainContent,
       )
      ],
    ),
    );
  }
}