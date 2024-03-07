import 'package:activity_theming/widgets/expenses_list/add_item_sheet.dart';
import 'package:activity_theming/widgets/expenses_list/expenses_list.dart';
import 'package:activity_theming/models/expense.dart';
import 'package:flutter/material.dart';

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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const AddItemSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('지출 내역 기록'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, //
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'), //
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
