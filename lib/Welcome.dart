import 'package:expense_tracker/Login.dart';
import 'package:expense_tracker/Signup.dart';
import 'package:expense_tracker/color.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_p9,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text("\n\n\nMange your\nfinances more\neasier",
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){


                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  const Login()));


                  },



                      style: ElevatedButton.styleFrom(
                        //elevation: 0,
                          backgroundColor: color_p10,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),

                          )

                      ),
                  child: Container(
                    height: 60,
                    width: 120,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: color_p10
                    // ),
                    child: Center(
                      child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ),
          ]
        ),
                  SizedBox(height :20),

          ElevatedButton(onPressed: (){


            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  const Signup()));


          },



            style: ElevatedButton.styleFrom(
              //elevation: 0,
                backgroundColor: color_p10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),

                )

            ),

            child:Container(
                    height: 60,
                    width: 120,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: color_p10,
                    // ),
                    child: Center(
                      child: Text('SIGNUP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
                ],
              ),





          ),

        ),

    );
  }
}
