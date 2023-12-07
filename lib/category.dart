import 'package:expense_tracker/Expensecategory.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/incomecategory.dart';
import 'package:expense_tracker/setting.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(


        appBar: AppBar(
          backgroundColor: color_p9,
          bottom: const TabBar(
              tabs: [
                Tab(text: "Income"),
                Tab(text: "Expense"),
              ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Setting()));
            },
          ),
        ),
        body: const TabBarView(
            children: [
              IncomeCategory(),
              ExpenseCategory(),
            ]
        ),
      ),
    );
  }
}
