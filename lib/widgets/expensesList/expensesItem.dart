import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';

class Expensesitem extends StatelessWidget{
  const Expensesitem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
      child: Text(expense.title),
    ),
    );
  }
}