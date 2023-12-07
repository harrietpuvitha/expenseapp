import 'dart:math';

import 'package:expense_tracker/Icons.dart';
import 'package:flutter/material.dart';
import 'color.dart';


class IncomeCategory extends StatefulWidget {
  const IncomeCategory({Key? key}) : super(key: key);


  @override
  State<IncomeCategory> createState() => _IncomeCategoryState();

}

List<String>title=[
   "Gift",
  "Check",
  "Interest",
  "Salary",
  "Other",
];
List<IconData>icon=[Icons.card_giftcard_outlined,Icons.money_outlined ,Icons.account_balance_outlined,
  Icons.currency_rupee,Icons.miscellaneous_services,
  ];
List<Color>colors=[
  color_gradient_box12,
  Colors.green,
  color_gradient_box62,
  Colors.deepOrange,
  Colors.indigo,
];
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
              setState(() {
                title.add(ctrTitle.text.toString());
                icon.add(Icons.confirmation_number_sharp);
                colors.add(Colors.redAccent);

                Navigator.pop(context);
              });
            }, child: Text("Add"))

          ],
        );
      } );

    },
    child: Icon(Icons.add),

    ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio:1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0),
          itemCount: icon.length,
          itemBuilder: (BuildContext context, int Index) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon[Index],
                    color: colors[Index],
                    size: 40,
                    shadows: [Shadow(
                        blurRadius: 20,
                        offset: Offset(3, 6),
                        color: colors[Index]
                    )],
                  ),
                  SizedBox(height: 8,),
                  Center(
                    child: Text(
                      title[Index].toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),


                ],
              ),
            );

          },
      ),
    );
  }
}
