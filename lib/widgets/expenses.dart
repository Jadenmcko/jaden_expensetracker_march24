import 'package:flutter/material.dart';
import 'package:jaden_expensetracker_march24/models/expense.dart';
import 'package:jaden_expensetracker_march24/widgets/chart/chart.dart';
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
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // clearing the expeneses. the undo button works for only one expense
    // ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 4),
      content: Text("Expense was deleted"),
      action: SnackBarAction(label: "Undo?", onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
      }),
    )
    );
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
    Widget mainContent = const Center(child: Text("There is no expenses. Click the plus (+) to add one"),);
    if(_registeredExpenses.isNotEmpty){
      mainContent = Expenseslist(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(appBar: AppBar(title: const Text("EXpense Tracker"),
    actions: [IconButton(icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay,
    )],),
      body: Column(children: [
        Chart(expenses: _registeredExpenses),
        Expanded(child: mainContent),
      // Text("Chart Data"),
      Expanded(
        child: mainContent
        // Expenseslist(
        //   onRemoveExpense: _removeExpense,
        //   expenses: _registeredExpenses)
          )],
        ),
      );
  }
}