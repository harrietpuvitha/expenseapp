import 'dart:ffi';

import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/incomecategory.dart';
import 'package:expense_tracker/incomeform.dart';
import 'package:flutter/material.dart';
import 'incomeObject.dart';





class Incomepage extends StatefulWidget {
  const Incomepage({Key? key}) : super(key: key);

  @override
  State<Incomepage> createState() => _IncomepageState();
}

class _IncomepageState extends State<Incomepage> {

  // List<Income>income=[
  // Income(title: "Salary",amount: 25000,date: "15.7.2023",category: "salary"),
  // Income(title: "GiftCard",amount: 35000,date: "23.8.2023",category: "salary"),
  // Income(title: "Donation",amount: 55000,date: "13.9.2023",category: "salary"),
  // Income(title: "Salary",amount: 28000,date: "11.10.2023",category: "salary"),
  // Income(title: "Salary",amount: 48000,date: "13.11.2023",category: "salary"),
  // Income(title: "Salary",amount: 48000,date: "13.11.2023",category: "salary"),
  //   ];
  // List<IconData>icon=[Icons.directions_train_outlined,Icons.card_giftcard,Icons.miscellaneous_services,Icons.sports_soccer,Icons.sports_soccer,Icons.sports_soccer];
  // List<Color>colors=[
  //   Colors.purple,
  //   Colors.yellow,
  //   Colors.blueAccent,
  //   Colors.deepOrange,
  //   Colors.pink,
  //   Colors.green,
  //
  // ];
  double total=0;
  double price=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(final price in incomeList.value){
      total +=double.parse(price.amount.toString());
    }
    //print("total:"+total.toString());

    }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_p9,
        title: Text("INCOME"),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold

      ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavigation()));

          },

        ),

      ),
      backgroundColor: Colors.white,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Expanded(
              child: Container(
                //margin: EdgeInsets.all(10),

                child: incomeList.value.isNotEmpty ? ValueListenableBuilder(
                  valueListenable: incomeList,
                  builder: (Builder,value,child) {
                    return ListView.builder(
                        itemCount: incomeList.value.length,
                        itemBuilder: (BuildContext context, int Index) {
                          return Container(
                            height: 60,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: color_p7,
                              )),
                            ),

                            child: Row(
                              children: [
                                // Expanded(
                                //   child: Icon(icon[Index],
                                //     color: colors[Index],
                                //     shadows: [Shadow(
                                //         blurRadius: 20,
                                //         offset: Offset(3, 6),
                                //         color: colors[Index]
                                //     )
                                //     ],
                                //   ),
                                // ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Container(
                                    //margin: EdgeInsets.all(10),

                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    //children: [
                                    child: Text(
                                        incomeList.value[Index].title.toString()),
                                    //]
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      incomeList.value[Index].amount.toString(),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Expanded(child: Container(
                                  child: Text(incomeList.value[Index].date.toString()),
                                )),
                                SizedBox(width: 20,),
                                Expanded(child: Container(
                                  child: Text(incomeList.value[Index].category.toString()),
                                ))
                              ],
                            ),
                          );
                        }
                    );
                    
                  }
                ) : Text("No Data found",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),

              ),
            ),
            Container(
              color: color_p9,
              alignment: Alignment.center,
              height: 60,
              //padding: EdgeInsets.all(70),

              child: Text("Total = "+total.toString(),
                style:  TextStyle(
                  fontSize: 25,
                  fontWeight:FontWeight .w600,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),


          ]
      )



    );
  }
}


