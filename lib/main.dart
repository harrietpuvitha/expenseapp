import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/Bottomsheet.dart';
import 'package:expense_tracker/Expense.dart';
import 'package:expense_tracker/Expensecategory.dart';
import 'package:expense_tracker/Login.dart';
import 'package:expense_tracker/Signup.dart';
import 'package:expense_tracker/Welcome.dart';
import 'package:expense_tracker/category.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/expanded.dart';
import 'package:expense_tracker/expenseform.dart';
import 'package:expense_tracker/income.dart';
import 'package:expense_tracker/incomecategory.dart';
import 'package:expense_tracker/incomeform.dart';

import 'package:expense_tracker/setting.dart';
import 'package:expense_tracker/widgets/expenseObject.dart';
import 'package:flutter/material.dart';

import 'example.dart';
import 'home1.dart';
import 'list.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFEFEFEF)),


      home:IncomeForm(),
    );
  }
}

