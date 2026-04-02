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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(16),
    child: Column(children: [
      TextField(controller: _titleController,maxLength: 50, keyboardType: TextInputType.name, decoration: InputDecoration(
        label: Text("Ttitle"),),
        ),
        Row(children: [
          //
        ]),
        Row(children: [ElevatedButton(onPressed: (){print(_titleController.text);
        }, child: Text("Save Your Expense"))],)
      ]),
    );
  }
}