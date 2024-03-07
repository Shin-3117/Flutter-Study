import 'package:activity_theming/models/expense.dart';
import 'package:activity_theming/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    // scroll 최적화
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            alignment: Alignment.center,
          ),
          // secondaryBackground: Container(
          //   color: Colors.green,
          // ),
          key: ValueKey(expenses[index]), //
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpensesItem(expenses[index]),
        ),
      ),
    );
  }
}
