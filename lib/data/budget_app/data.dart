import 'dart:math';

import 'package:designer_app2/models/budget_app/category_model.dart';
import 'package:designer_app2/models/budget_app/expense_model.dart';



final rand = Random();

final List<double> weeklySpending = [
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
  (rand.nextDouble() * 100).abs(),
];

_generateExpenses() {
  List<Expense> expenses = [
    Expense(name: 'Item 0', cost: (rand.nextDouble()).abs() * 90),
    Expense(name: 'Item 1', cost: (rand.nextDouble()).abs() * 90),
    Expense(name: 'Item 2', cost: (rand.nextDouble()).abs() * 90),
    Expense(name: 'Item 3', cost: (rand.nextDouble()).abs() * 90),
    Expense(name: 'Item 4', cost: (rand.nextDouble()).abs() * 90),
    Expense(name: 'Item 5', cost: (rand.nextDouble()).abs() * 90),
  ];
  return expenses;
}

List<Category> categories = [
  Category(name: 'Food', maxAmount: 450, expenses: _generateExpenses()),
  Category(name: 'Clothing', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Utilities', maxAmount: 600, expenses: _generateExpenses()),
  Category(
      name: 'Entertainment', maxAmount: 330, expenses: _generateExpenses()),
  Category(
      name: 'Transportation', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Housing', maxAmount: 1000, expenses: _generateExpenses()),
];
