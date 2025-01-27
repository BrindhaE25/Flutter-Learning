import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widget/expense_list/new_expense.dart';
import 'package:flutter/material.dart';

import 'expense_list/expense_list.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<StatefulWidget> createState() {
   return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense> {
  List<Expenses> expenses = [
    Expenses(title: "movie", amount: 14.66, date: DateTime.now(), category: Category.leisure),
    Expenses(title: "book", amount: 25.90, date: DateTime.now(), category: Category.work),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: (){
                _showOverlay();
              },
              icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(child: ExpenseList(expenseList : expenses)),
        ],
      ),
    );
  }

  void _showOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }

}
