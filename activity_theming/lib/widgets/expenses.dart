import 'package:activity_theming/widgets/expenses_list/expenses_list.dart';
import 'package:activity_theming/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'bugger',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'movie',
        amount: 10.5,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'JP',
        amount: 100.5,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'pencel',
        amount: 1.5,
        date: DateTime.now(),
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text('Chart'), //
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
