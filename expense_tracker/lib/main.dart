import 'package:flutter/material.dart';
import 'widget/expense.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home : const Expense()
  ));
}


