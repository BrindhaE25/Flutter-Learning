import 'package:expense_tracker/widget/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expenses.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList});

  final List<Expenses> expenseList;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) =>
           ExpenseItem(expenseList[index]),
    );
  }

}
