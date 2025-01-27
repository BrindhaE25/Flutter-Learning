import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat.yMd();

enum Category {
  leisure, food, travel, work
}

const categoryIcon = {
  Category.food : Icons.lunch_dining_rounded,
  Category.leisure : Icons.movie_creation_rounded,
  Category.travel : Icons.flight_takeoff,
  Category.work : Icons.work
};

class Expenses {
  static const uuid = Uuid();

  Expenses(
  {
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

