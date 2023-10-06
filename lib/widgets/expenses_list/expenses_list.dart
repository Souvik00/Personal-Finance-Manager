import 'package:flutter/cupertino.dart';
import 'package:personal_finance_manger/models/expense.dart';
import 'package:personal_finance_manger/widgets/expenses_list/expense_item.dart';
class ExpensesList extends StatelessWidget{
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;
  final void Function(Expense expense)onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx,index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction){
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index])
        ),
    );
    
  }
}