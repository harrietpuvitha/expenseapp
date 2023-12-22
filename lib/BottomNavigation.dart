import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/expenseform.dart';
import 'package:expense_tracker/home1.dart';
import 'package:expense_tracker/incomeform.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index_color=0;
  List Screen=[Home(),];
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(


      body: Screen[index_color],

      floatingActionButton: keyboardIsOpened?null:
        FloatingActionButton(
          onPressed: (){
            showMenu(
              color: color_p9,
                context: context,


                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    )),
                position: RelativeRect.fromLTRB(150, 550,150,900), // Adjust position as needed
                items: <PopupMenuEntry>[
            PopupMenuItem(
            child: GestureDetector(
            child:Text('Expense',

              style: TextStyle(
                color: Colors.white,

                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExpenseForm()));
              },
            ),
            ),
            PopupMenuItem(
                child: GestureDetector(
                  child: Text("Income",
                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  onTap: (){
                    Navigator.push(context,
                               MaterialPageRoute(builder: (context) => IncomeForm()));

                  },

                )
            )

            ],
            );
          },
          child:Icon(Icons.add,
          color: Colors.white,),
          backgroundColor: color_p9,

        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: Padding(
      //     padding: EdgeInsets.only(top: 9,bottom: 9),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         // GestureDetector(
      //         //   onTap: (){
      //         //     setState(() {
      //         //       index_color=0;
      //         //     });
      //         //   },
      //         //   child: Icon(
      //         //     Icons.home,
      //         //     size: 30,
      //         //     color: color_gray15,
      //         //   ),
      //         // ),
      //         // GestureDetector(
      //         //   onTap: (){
      //         //     setState(() {
      //         //       index_color=0;
      //         //     });
      //         //   },
      //         //   child: Icon(
      //         //     Icons.account_balance_wallet_rounded,
      //         //     size: 30,
      //         //     color: color_gray15,
      //         //   ),
      //         // ),
      //         // GestureDetector(
      //         //   onTap: (){
      //         //     setState(() {
      //         //       index_color=0;
      //         //     });
      //         //   },
      //         //   child: Icon(
      //         //     Icons.bar_chart,
      //         //     size: 30,
      //         //     color: color_gray15,
      //         //   ),
      //         // ),
      //         // GestureDetector(
      //         //   onTap: (){
      //         //     setState(() {
      //         //       index_color=0;
      //         //     });
      //         //   },
      //         //   child: Icon(
      //         //     Icons.account_box,
      //         //     size: 30,
      //         //     color: color_gray15,
      //         //   ),
      //         // ),
      //       ],
      //
      //     ),
      //   ),
      // ),

    );
  }
}
