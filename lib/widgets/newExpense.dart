import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Newexpense extends StatefulWidget{
  const Newexpense({super.key});
  State<Newexpense> createState(){
    return _NewexpenseState();
  }
}
class _NewexpenseState extends State<Newexpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(16),
    child: Column(children: [
      TextField(controller: _titleController,
      maxLength: 50, keyboardType: TextInputType.name, decoration: InputDecoration(
        label: Text("Ttitle"),),
        ),
  
          // amount field
          TextField(controller: _amountController,
          maxLength: 10, keyboardType: TextInputType.number, decoration: InputDecoration(
            prefixText: '\$', label: Text("Amount")),),
     
        Row(children: [ElevatedButton(onPressed: (){print(_titleController.text); print(_amountController);
        }, child: Text("Save Your Expense"))],)
      ]),
    );
  }
}