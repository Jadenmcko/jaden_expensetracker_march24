import 'package:jaden_expensetracker_march24/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
final formatter = DateFormat.yMd();
class Newexpense extends StatefulWidget{
  const Newexpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  State<Newexpense> createState(){
    return _NewexpenseState();
  }
}
class _NewexpenseState extends State<Newexpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  // apr 8
  Category _selectedCategory = Category.leisure;
  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    final amountisInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountisInvalid || _selectedDate == null){
      //errorrr
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text("Invalid Inout!"),
        content: const Text("Please make sure you into a valid title, amount, and date"),
        actions: [TextButton(onPressed: (){
          Navigator.pop(ctx);
        }, child: const Text("Understood"))],
      )); return;
    }
    // save it otherwise
    widget.onAddExpense(
      Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory)
    );
  }
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
    return Padding(padding: EdgeInsets.fromLTRB(20, 48, 16, 16),
    child: Column(children: [
      TextField(controller: _titleController,
      maxLength: 50, keyboardType: TextInputType.name, decoration: InputDecoration(
        label: Text("Ttitle"),),
        ),
  
          // amount field
          Row(
            children: [Expanded(
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
          SizedBox(height: 8,),
        Row(children: [
          DropdownButton(
            // apr 8
            value: _selectedCategory,
            items: Category.values.map(
          (category) => DropdownMenuItem(value: category,
            child: Text(category.name.toUpperCase(),))
          ) .toList(),
           onChanged: (value){
            if(value == null){
              return;
            }
            setState(() {
              _selectedCategory = value;
            });
           }),
           Spacer(),
          ElevatedButton(onPressed: _submitExpenseData,
          // print(_titleController.text); 
          // print(_amountController);
        child: Text("Save Your Expense")),
        ElevatedButton(onPressed: (){
          // make a cancel button
          Navigator.pop(context);
        }, child: const Text("Cancel"))
        ],)
      ]),
    );
  }
}