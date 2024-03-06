import 'package:activity_theming/models/expense.dart';
import 'package:activity_theming/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    // scroll 최적화
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => ExpensesItem(expenses[index]));
  }
}
