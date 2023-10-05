import 'package:flutter/cupertino.dart';
import 'package:personal_finance_manger/models/expense.dart';
import 'package:personal_finance_manger/widgets/expenses_list/expense_item.dart';
class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,
    required this.expenses
  });
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx,index) => ExpenseItem(expenses[index]),
    );
    
  }
}