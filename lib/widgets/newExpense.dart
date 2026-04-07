import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
final formatter = DateFormat.yMd();
class Newexpense extends StatefulWidget{
  const Newexpense({super.key});
  State<Newexpense> createState(){
    return _NewexpenseState();
  }
}
class _NewexpenseState extends State<Newexpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  void _presentDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1, now.month, now.day);
    final pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firstDate, lastDate: now);
    print(_selectedDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
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
          Row(
            children: [
              Expanded(
                child: TextField(controller: _amountController,
                maxLength: 10, keyboardType: TextInputType.number, decoration: InputDecoration(
                  prefixText: '\$', label: Text("Amount")),),
              ),
              SizedBox(width: 16),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                // const Text("Select the Date"),
                Text( _selectedDate == null ? "Selected Date": formatter.format(_selectedDate!)),
                IconButton(onPressed: _presentDatePicker, icon: const Icon(Icons.calendar_month))
              ],))
            ],
          ),
     
        Row(children: [ElevatedButton(onPressed: (){
          print(_titleController.text); 
          print(_amountController);
        }, child: Text("Save Your Expense")),
        ElevatedButton(onPressed: (){
          // make a cancel button
          Navigator.pop(context);
        }, child: Text("Cancel"))
        ],)
      ]),
    );
  }
}