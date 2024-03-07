import 'package:flutter/material.dart';
//flutter pub add uuid
import 'package:uuid/uuid.dart';
//flutter pub add intl
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

// Type 생성 : 포함 된 값만 허용함
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.local_restaurant, //
  Category.travel: Icons.airplane_ticket,
  Category.leisure: Icons.local_play,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // Icon get categortIcon {
  //   return
  // }
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  //팩토리 생성자: 모든 지출 항목과 카테고리를 인자로 받아
  //특정 카테고리에 속하는 지출 항목만을 포함하는 ExpenseBucket 인스턴스를 생성
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category) //fitter
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
