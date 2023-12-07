import 'package:expense_tracker/Expense.dart';
import 'package:expense_tracker/Login.dart';
import 'package:expense_tracker/color.dart';
import 'package:expense_tracker/income.dart';
import 'package:expense_tracker/setting.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int total = 0;
  int income =0;
  int expenses=0;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override

  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: color_gray11,
      body: SafeArea(
        child:CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child:SizedBox(height: 380, child: _head()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transaction History',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text('All transactions',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black54,
                      ),

                    )
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
                (context,index){
                  return ListTile(leading: ClipRRect(borderRadius: BorderRadius.circular(5)),);
                }
            ))
          ],
        )
    ),
      
    );
  }
 Widget _head(){
    return Stack(
    children: [
    Column(
    children: [
    Container(
    height: 300,
    decoration: BoxDecoration(
    color: color_p9,

    ),

    child: Column(

    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    SizedBox(height: 50,),
    // Container(
    // alignment: Alignment.topLeft,
    // padding: EdgeInsets.only(left: 20),
    // child: IconButton(
    // icon:Icon(Icons.arrow_back_sharp,
    //   size: 28,
    // ),
    // color: Colors.white,
    //
    //   onPressed: () {
    //     Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => Login()));
    //   },
    // ),
    // ),

      Container(
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20.0, right: 10.0),
        child: IconButton(
          icon: Icon(
            Icons.settings,
            size: 24,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Setting()));


          }
        ),

      )    ],
    ),

    ),
    ],
    ),

    Positioned(
    top: 200,
    child: Container(
    height: 180,
    width: MediaQuery.of(context).size.width-40,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),

    ),
    child: Container(
    height: 180,
    width: MediaQuery.of(context).size.width-40,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),

    ),
    child: Column(
    children: [
    SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    'Total Balance',
    style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    Icon(
    Icons.more_horiz,
    color: Colors.black,
    ),
    ],
    ),
    ),
    SizedBox(height: 7),
    Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Row(
    children: [
    Text(
    '\$ ${total}',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    ]
    )
    ),
    SizedBox(height: 25,),
    Padding(
    padding:EdgeInsets.symmetric(horizontal: 15),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Incomepage()));
      },

        child: Row(
        children: [
        CircleAvatar(
        radius: 20,
        backgroundColor: darkGreen,
        child: Icon(
         Icons.arrow_downward_rounded,
          color: Colors.black,
        ),
        ),
        SizedBox(width: 7),
        Text(
        'Income',
        style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black,
        ),
        ),
        ]
        ),
      ),

    GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Expensepage()));
      },
      child: Row(
      children: [
      CircleAvatar(
      radius: 20,
      backgroundColor: Colors.red[300],
      child: Icon(
        Icons.arrow_upward_rounded,
          color: Colors.black,
        ),
      ),
      // child: Icon(
      // Icons.arrow_upward_rounded,
      //
      // color: Colors.black,
      // size: 19,
      //
      // ),

      SizedBox(width: 7),
      Text(
      'Expense',
      style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.black,
      ),
      ),
      ]
      ),
    ),
    ]
    )
    ),
    SizedBox(height: 6),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    '\$ ${income}',
    style: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    Text(
    '\$ ${expenses}',
    style: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    ]

    ),
    ),

    ]
    ),
    ),

    ),
    )
    ]
    );
  }
}


