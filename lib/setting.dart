
import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/category.dart';
import 'package:flutter/material.dart';

import 'Welcome.dart';
import 'color.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color_p9,
        centerTitle: true,
        title: Text("Settings",
        style: TextStyle(
          fontSize: 20,
        ),),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BottomNavigation()));
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Category()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.menu_open,
                  color: Colors.indigo,),
                  SizedBox(width: 10,),
                  Text("Category",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            //Divider(height: 30,thickness: 1,),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return Container(
                    child: AlertDialog(
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      title: Text("Exit App"),
                      content: Text("Do You want to close the App"),
                      actions:[


                        ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Welcome()));

                          //Navigator.of(context).pop(true);

                        },
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(color_p9)
                            ),
                            child: Text("Yes")
                        ),
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pop(false);
                        },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(color_p9)
                          ),
                          child: Text("No"),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.logout,
                    color: Colors.indigo,),
                  SizedBox(width: 10,),
                  Text("Logout",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
