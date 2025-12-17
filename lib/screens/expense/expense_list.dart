import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/expense/expense_items.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget 
{
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(context) 
  {
    
    return ListView.builder
    (
      itemBuilder: (context,index) =>  ExpenseItems(expenses[index]), 
      itemCount: expenses.length,
    );
  }
}