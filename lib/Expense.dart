import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/widgets/expenseObject.dart';
import 'package:flutter/material.dart';

class Expensepage extends StatefulWidget {
  const Expensepage({Key? key}) : super(key: key);

  @override
  State<Expensepage> createState() => _ExpensepageState();
}

class _ExpensepageState extends State<Expensepage> {
  final List<Expense>expense=[
    Expense(title: 'Books',amount: 2000,category: 'Education',date: '23.10.2023'),
    Expense(title: 'Gift',amount: 1000,category:'Gift',date: '13.8.2023'),
    Expense(title: 'Train',amount: 750,category: 'Transport',date: '5.5.2023'),
    Expense(title: 'Foods',amount: 350,category: 'Foods',date: '10.10.2023'),
    Expense(title: 'Medicine',amount: 600,category:'Hospital',date: '23.10.2023'),
    Expense(title: 'Medicine',amount: 3000,category:'Hospital',date: '23.10.2023'),

  ];
  List<IconData>icon=[Icons.directions_train_outlined,Icons.card_giftcard,Icons.sports_soccer,Icons.sports_soccer,
    Icons.sports_soccer,
    Icons.sports_soccer,
  ];
  List<Color>colors=[
    Colors.purple,
     Colors.yellow,
     Colors.blueAccent,
     Colors.deepOrange,
     Colors.pink,
   Colors.green,

  ];


  int total =0;
  int price=0;
  @override
  void initState() {
    super.initState();
    for(final price in expense){
      total +=int.parse(price.amount.toString());
    }
    print("total:"+total.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_p9,
        title: Text("EXPENSE"),
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
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: expense.isNotEmpty ? ListView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: expense.length,
                    itemBuilder: (BuildContext context, int Index) {
                      return Container(
                        height: 60,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(
                            color: color_p8,
                          )),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(icon[Index],
                                color: colors[Index],
                                shadows: [Shadow(
                                    blurRadius: 20,
                                  offset: Offset(2, 6),
                                  color: colors[Index]
                                )],
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                                child: Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(expense[Index].title.toString()),
                                      SizedBox(height: 10,),
                                      Text(expense[Index].category.toString())
                                    ],

                      ),
                                ),
                            ),

                            SizedBox(width: 60,),
                            Expanded(
                                child:Container(
                                    child: Text(expense[Index].amount.toString()))),
                            //SizedBox(width: 10,),
                            // Expanded(
                            //     child:Container(
                            //         child: Text(expense[Index].date.toString()))),

                          ],

                        ),


                        //horizontalTitleGap: 90,
                      );
                    }


                ) : Container(
                  child: Text("No Data found",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
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
        ],

        ),






    );


  }
}



