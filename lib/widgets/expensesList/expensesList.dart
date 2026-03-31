import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';
import 'package:jaden_expensetracker_march24/widgets/expensesList/expensesItem.dart';

class Expenseslist extends StatelessWidget{
  const Expenseslist({super.key, required this.expenses});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:expenses.length, 
    itemBuilder: (ctx, index) => Expensesitem(expense: expenses[index]));
  }
}