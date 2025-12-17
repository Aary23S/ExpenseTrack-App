import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/expense/expense_items.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget 
{
  const ExpenseList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expenses) onRemoveExpense;

  @override
  Widget build(context) 
  {
    
    return ListView.builder
    (
      itemCount: expenses.length,
      itemBuilder: (context,index) =>  Dismissible
      (
        key: ValueKey(expenses[index]), 
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItems(expenses[index])
      ), 
    );
  }
}