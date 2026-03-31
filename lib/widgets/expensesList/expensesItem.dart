import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';

class Expensesitem extends StatelessWidget{
  const Expensesitem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19,),
      child: Column(
        children: [
          Text(expense.title), const SizedBox(height: 4), // space between row and column
          Row(children: [Text('\$${expense.amount.toStringAsFixed(2)}'),
          Spacer(),
          Row(children: [Icon(categoryIcons[expense.category]), const SizedBox(width: 10),
          Text(expense.formattedDate)
          ],)],)
        ],
      ),
    ),
    );
  }
}