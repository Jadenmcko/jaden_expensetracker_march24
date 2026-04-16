import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category {travel, leisure, work, food}
const categoryIcons={Category.food: Icons.lunch_dining_rounded, Category.leisure: Icons.shopping_cart,
Category.travel: Icons.flight_takeoff_sharp, Category.work: Icons.work_rounded};
class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category}) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get formattedDate{
    return formatter.format(date);
  }
}
class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expeneses});
  ExpenseBucket.forCategory(
    List<Expense> allExpenses, this.category)
    : expeneses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expeneses;
  double get totalExpenses {
    double sum = 0;
    for(final expense in expeneses){
      sum += expense.amount;
    }
    return sum;
  }
}