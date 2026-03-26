import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState(){
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  final List<Expense> _registeredExpenses = [
    Expense(title: "Amores Pizza Cafe", amount: 15.94, date: DateTime.now(), category: Category.food),
    Expense(title: "Whole Foods Market", amount: 22.73, date: DateTime.now(), category: Category.food),
    Expense(title: "Long Island Rail Road", amount: 106.99, date: DateTime.now(), category: Category.travel),
    Expense(title: "Staples", amount: 8.34, date: DateTime.now(), category: Category.work)
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Column(children: [
      Text("Chart Data"),
      SizedBox(height: 30),
      Text("Expenses data would go here")],
      ));
  }
}