// ignore_for_file: unused_import, avoid_print
import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class NewExpense extends StatefulWidget 
{
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> 
{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory=Category.none;

  @override
  void dispose()
  {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void _pickDateTime() async
  {
      var nowDate = DateTime.now();
      var firstDate = DateTime(DateTime.now().year-1,DateTime.now().month,DateTime.now().day);
      final pickedDate = await showDatePicker(context: context, firstDate: firstDate, lastDate: DateTime.now(), initialDate: nowDate);
      setState
      (
        () {
          _selectedDate=pickedDate;
        }
      );
  }

  @override
  Widget build(context) 
  {
    return Padding
    (
      padding: const EdgeInsets.all(16.0),
      child: Column
      (
        children: 
        [
          TextField
          (
            // onChanged: _saveInputTitle,
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration
            (
              labelText: 'Title',
            ),
            // keyboardType: TextInputType.name,
          ),
          Row
          (
            children: 
            [
              Expanded
              (
                child: TextField
                (
                  controller: _amountController,
                  maxLength: 15,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration
                  (
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded
              (
                child: Row
                (
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: 
                  [
                    Text(_selectedDate == null ? "Select The Date" : formater.format(_selectedDate!), style: TextStyle(fontSize: 16),),
                    // const SizedBox(width: 15,),
                    TextButton
                    (
                      onPressed: _pickDateTime,
                      child: Icon(Icons.date_range_sharp)
                    ),
                  ],
                ),
              )
            ],
          ),
          Row
          (
            children: 
            [
              DropdownButton
              (
                value: _selectedCategory,
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  ),
                ).toList(),
                onChanged: (value)
                {
                    setState(() {
                      _selectedCategory=value!;
                    });
                },
              ),
              const Spacer(),
              ElevatedButton
              (
                onPressed: ()
                {
                  print('Saved');
                  print(_titleController.text);
                  print(_amountController.text);
                },
                style: ElevatedButton.styleFrom
                (
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(20),
                    ),
                ),
                child: const Text('Save Expense'),
              ),
              TextButton
              (
                onPressed: ()
                {
                  print('Cancel');
                  Navigator.pop(context);
                
                }, 
                child: const Text('Cancel')
              )
            ],
          )
        ],
      )
    );
  }
}