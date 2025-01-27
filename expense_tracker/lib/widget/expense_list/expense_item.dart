import 'package:flutter/material.dart';
import '../../models/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14
          ),
        child: Column(
          children: [
            Text(expense.title),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                   Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 15,),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
