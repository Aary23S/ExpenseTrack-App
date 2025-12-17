// ignore_for_file: unused_import

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formater = DateFormat.yMd();

enum Category  
{ 
  none,
  food,
  travel,
  leisure,
  work, 
}

const categoryIcons =
{
  Category.food: Icons.restaurant,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,

};

class Expense 
{
  Expense
  (
    {
      required this.title,
      required this.amount,
      required this.date,
      required this.category,
    }
  ): id=uuid.v4();
  
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatDate => formater.format(date);
}
