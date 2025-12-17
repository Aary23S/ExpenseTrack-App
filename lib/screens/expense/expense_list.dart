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
      itemBuilder: (context,index) =>  Dismissible(
      key: ValueKey(expenses[index]),
      // Background shown while swiping (start -> end). We use the
      // theme's `error` color so the red matches the app's palette
      // and `onError` for the icon/text color that contrasts it.
      background: Container
      (
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),

      // Secondary background for swiping in the opposite direction
      // (end -> start). Keeps UX consistent for both swipe directions.
      secondaryBackground: Container
      (
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),

        // Called after the widget has been dismissed (fully swiped).
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },

        // The item to show inside the Dismissible. Keep this as-is so
        // your existing `ExpenseItems` widget is reused.
        child: ExpenseItems(expenses[index]),
      ),
    );
  }
}