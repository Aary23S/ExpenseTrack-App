// ignore_for_file: avoid_unnecessary_containers, unused_element, unused_local_variable

import 'package:expense_app/models/expense.dart';
import 'package:expense_app/screens/expense/expense_list.dart';
import 'package:expense_app/screens/expense/new_expense.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  final List<Expense> _registeredExpenses = 
  [
    Expense
    (
      title: 'Flutter Course', 
      amount: 19.99, 
      date: DateTime.now(), 
      category: Category.work
    ),
    Expense
    (
      title: 'Cinema', 
      amount: 15.69, 
      date: DateTime.now(), 
      category: Category.leisure
    ),
  ]; 

  void _onClickOnAddBtn()
  {
    showModalBottomSheet
    (
      context: context, 
      isScrollControlled: true,
      builder: (ctx)
      {
        return NewExpense(onAddExpenses: _addNewExpenses);
      }
    );
  }

  void _addNewExpenses(Expense expenses)
  {
    setState(() {
      _registeredExpenses.add(expenses);
    });
  }

  void _removeExpenses(Expense expenses)
  {
    setState(() {
      _registeredExpenses.remove(expenses);
    });

  }
  @override
  Widget build(BuildContext context) 
  {
    Widget mainContent = const Center
    (
      child: Text('No expenses found. Start adding some!'),
    );

    if(_registeredExpenses.isNotEmpty)
    {
      mainContent = ExpenseList(expenses: _registeredExpenses, onRemoveExpense: _removeExpenses);
    }
    
    return Scaffold
    (
      appBar: AppBar
      (
        actions: 
        [
            IconButton
            (
              onPressed: _onClickOnAddBtn,
              icon: const Icon(Icons.add_box_rounded),
            )
        ],
        title: const Text('Expense Tracker'),
        backgroundColor: Colors.blue,
      ),
      
      body: Column
      (
        children: 
        [
          Expanded
          (
            child: mainContent,
          )
        ],
      ),
    );
    
  }

}