import 'package:activity_theming/widgets/chart/chart.dart';
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
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddItemSheet(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3), //
        content: Text('삭제완료'), //
        action: SnackBarAction(
          label: '되돌리기',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start add something'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
          Chart(expenses: _registeredExpenses), //
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
