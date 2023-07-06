import 'package:uuid/uuid.dart'; // uuid is a package that generates unique ids. (3rd party package)
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.sports_soccer,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid
            .v4(); // uuid.v4() generates a unique id string and passes it to the id parameter.

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket(this.category, this.expenses);
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
