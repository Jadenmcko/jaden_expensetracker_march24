import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState(){
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
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