// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:expense_app/screens/expense/expense_list.dart';
import 'package:expense_app/models/expense.dart';
// import 'package:expense_app/screens/expense/expense_items.dart';

class ExpenseItems extends StatelessWidget 
{
  const ExpenseItems(this.expenses,{super.key});
  final Expense expenses;

  @override
  Widget build(BuildContext context) 
  {
    return Card
    (
      child: Padding
      (
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column
        (
          children: 
          [
            Text(expenses.title,style: TextStyle(fontSize: 17)),
            const SizedBox(height: 20,),
            Row
            (
              children: 
              [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row
                (
                  children: 
                  [
                    Text(expenses.formatDate),
                    const SizedBox(width: 8,),
                    Icon(categoryIcons[expenses.category]),
                    
                  ],
                )
              ],
            )           
          ],
        )
      ),
    );
  }
}