import 'package:flutter/material.dart';
import 'home_screen.dart';

class MyApp extends StatefulWidget 
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  
  
  @override
  Widget build(context) 
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}