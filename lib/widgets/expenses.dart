import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';
import 'package:jaden_expensetracker_march24/widgets/expensesList/expensesList.dart';
import 'package:jaden_expensetracker_march24/widgets/newExpense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState(){
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  void _openAddExpenseOverlay(){
    showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (ctx) => Newexpense(onAddExpense: _addExpense));
  }
  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }
  final List<Expense> _registeredExpenses = [
    Expense(title: "Amores Pizza Cafe", amount: 15.94, date: DateTime.now(), category: Category.food),
    Expense(title: "Whole Foods Market", amount: 22.73, date: DateTime.now(), category: Category.food),
    Expense(title: "Long Island Rail Road", amount: 299.99, date: DateTime.now(), category: Category.travel),
    Expense(title: "Staples", amount: 8.34, date: DateTime.now(), category: Category.work)
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: const Text("EXpense Tracker"),
    actions: [IconButton(icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay,
    )],),
      body: Column(children: [
      Text("Chart Data"),
      // SizedBox(height: 30),
      Expanded(
        child: Expenseslist(
          onRemoveExpense: _removeExpense,
          expenses: _registeredExpenses))],
        ),
      );
  }
}