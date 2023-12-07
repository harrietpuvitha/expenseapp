import 'package:flutter/material.dart';

import 'color.dart';
import 'list2.dart';

class List1 extends StatefulWidget {
  const List1({Key? key}) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  List<Detail>litems=[

  ];
  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Form(
        key:formKey,
        child: Column(
        children: [

          SizedBox(height: 50,),
          TextFormField(

            controller:name,
            validator: (value) {
              if(value!.isEmpty){
                return "please enter name";
              }
              else{
                return null;
              }
            },
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: color_gray10,

              hintText: 'Name',
              // prefixIcon: Icon(Icons.currency_rupee,
              //   color: color_gray14,
              // ),
              //
              hintStyle: TextStyle(
               color: primaryColor2,
               ),

              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: color_gray10,
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )

              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(

                      color: color_gray10
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(

            controller:id,
            validator: (value) {
              if(value!.isEmpty){
                return "please enter ID";
              }
              else{
                return null;
              }
            },
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: color_gray10,

              hintText: 'ID',
              // prefixIcon: Icon(Icons.currency_rupee,
              //   color: color_gray14,
              // ),
              //
              hintStyle: TextStyle(
                color: primaryColor2,
              ),

              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: color_gray10,
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )

              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(

                      color: color_gray10
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(

            controller:phoneNumber,
            validator: (value) {
              if(value!.isEmpty){
                return "please enter phonenumber";
              }
              else{
                return null;
              }
            },
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: color_gray10,

              hintText: 'Phonenumber',
              // prefixIcon: Icon(Icons.currency_rupee,
              //   color: color_gray14,
              // ),
              //
              hintStyle: TextStyle(
                color: primaryColor2,
              ),

              focusedBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: color_gray10,
                  )
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )

              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(
                      color: color_gray10
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                  borderSide: BorderSide(

                      color: color_gray10
                  )
              ),
            ),
          ),
          SizedBox(height: 60,),
          ElevatedButton(onPressed: (){
            if(formKey.currentState!.validate()){
              litems.add(Detail(name: name.text,id:int.parse(id.text),phoneNumber:int.parse(phoneNumber.text)));


              //eCtrl.clear();
              setState(()  {


              });
              print(litems.toString());


            }
            else{
              print('details not entered');

            }
          },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),

                )

            ),

            child: Container(

              height: 70,
              width: 150,
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                child: Text('Add',

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),

                ),



              ),
            ),

          ),
           Expanded(
              child: ListView.builder
                (
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int Index) {
                    return Text(litems[Index].name.toString()+"\n" +litems[Index].id.toString()+"\n"+litems[Index].phoneNumber.toString());
                  }
              )
              ),

        ],
      ),
              ),
      ),
    );
  }
}
