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
  Category.food: Icons.lunch_dining, //
  Category.travel: Icons.airplane_ticket,
  Category.leisure: Icons.airport_shuttle,
  Category.work: Icons.badge,
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
