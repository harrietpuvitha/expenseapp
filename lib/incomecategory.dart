import 'dart:math';

import 'package:expense_tracker/Icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'color.dart';
ValueNotifier<List<String>> incomeCategoryList = ValueNotifier<List<String>>([
  "Gift",
  "Check",
  "Interest",
  "Salary",
   "Other",

]);

ValueNotifier<List<IconData>> iconList = ValueNotifier<List<IconData>>([

  Icons.card_giftcard_outlined,
  Icons.money_outlined ,
  Icons.account_balance_outlined,
  Icons.currency_rupee,
   Icons.miscellaneous_services,
]);
ValueNotifier<List<Color>>colorList=ValueNotifier<List<Color>>([
  color_gradient_box12,
  Colors.green,
  color_gradient_box62,
  Colors.deepOrange,
   Colors.indigo,
]);

class IncomeCategory extends StatefulWidget {
  const IncomeCategory({Key? key}) : super(key: key);


  @override
  State<IncomeCategory> createState() => _IncomeCategoryState();


}


// List<String>title=[
//    "Gift",
//   "Check",
//   "Interest",
//   "Salary",
//   "Other",
// ];

String input ="";
TextEditingController ctrTitle= TextEditingController();



class _IncomeCategoryState extends State<IncomeCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color_p9,
        onPressed: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

          title: Text('Add Items') ,
          content: TextField(
            controller: ctrTitle,
            onChanged: (String value){
              input = value;


            },
          ),
          actions:[
            TextButton(onPressed: (){

              incomeCategoryList.value.add(ctrTitle.text.toString());
                iconList.value.add(Icons.confirmation_number_sharp);
                colorList.value.add(Colors.redAccent);
              incomeCategoryList.notifyListeners();
                Navigator.pop(context);
                ctrTitle.clear();


            }, child: Text("Add"))
          ],
        );
      }
      );
    },
    child: Icon(Icons.add,
      color: Colors.white,
    ),
    ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: incomeCategoryList,
                builder: (context,value,child) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    itemCount: incomeCategoryList.value.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(iconList.value[Index],
                              color: colorList.value[Index],
                              size: 40,
                              shadows: [Shadow(
                                  blurRadius: 20,
                                  offset: Offset(3, 6),
                                  color: colorList.value[Index]
                              )
                              ],
                            ),
                            SizedBox(height: 8,),
                            Center(
                              child: Text(
                                value[Index].toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black ,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),


                          ],
                        ),
                      );
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
