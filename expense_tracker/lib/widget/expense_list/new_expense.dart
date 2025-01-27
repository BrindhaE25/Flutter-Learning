import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../models/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _textController = TextEditingController();
  final _moneyController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;



  @override
  void dispose() {
    _textController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  _showDatePicker() async{
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    var date = await showDatePicker(context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = date;
    });
  }

   _validateExpense() {
    double amount = double.parse(_moneyController.text);
    if(_textController.text.trim().isEmpty || amount <= 0 || amount == null || _selectedDate == null) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
           TextField(
              controller: _textController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _moneyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null ? "No date selected" : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                  items: Category.values.map((category) =>
                    DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()),
                    )).toList(),
                  onChanged: (value){
                  if(value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    _validateExpense();
                  },
                  child: const Text("Save Expense")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}

