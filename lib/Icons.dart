import 'package:flutter/material.dart';

import 'color.dart';



Map<String,IconData> icons={
  'Transport':Icons.directions_train_outlined,
  'Sports': Icons.sports_soccer,
  'Food And Drinks': Icons.local_pizza,
  'Entertainment': Icons.movie,
  'Education': Icons.school,
  'Family':Icons.family_restroom_rounded,
  'Gifts':Icons.card_giftcard,
  'Hospital':Icons.local_hospital,
  'Other': Icons.miscellaneous_services,

};
Map<String,Color> colors={
  'transport':Colors.purple,
  'Sports': Colors.yellow,
  'Food And Drinks': Colors.blueAccent,
  'Entertainment': Colors.deepOrange,
  'Education': Colors.pink,
  'Family':Colors.green,
  'Gifts':Colors.red,
  'Hospital':Colors.brown,
  'Other': Colors.indigo,
};
Map<String,IconData>incomeIcon={
  'Gift':Icons.card_giftcard_outlined,
  'Check':Icons.money_outlined ,
  'Interest':Icons.account_balance_outlined,
  'Salary':Icons.currency_rupee,
  'Other': Icons.miscellaneous_services,


};
Map<String , Color>incomeColor={
  'Gift': color_gradient_box12,
  'Check':Colors.green,
  'Interest':color_gradient_box62,
  'Salary':Colors.deepOrange,
  'Other': Colors.indigo


};