import 'package:flutter/material.dart';
import 'AddBook.dart';
import 'Home.dart';
import 'Test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
      routes: {"addBook":(context) => AddBook()},
    );
  }
}