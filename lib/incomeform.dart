
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'BottomNavigation.dart';
import 'Icons.dart';
import 'color.dart';
import 'incomeObject.dart';

class IncomeForm extends StatefulWidget {
  //const IncomeForm({Key? key}) : super(key: key);

  @override
  State<IncomeForm> createState() => _IncomeForm();
}

class _IncomeForm extends State<IncomeForm> {
  List<Income>details=[];
  TextEditingController date= TextEditingController();
  TextEditingController income= TextEditingController();
  TextEditingController amount= TextEditingController();
  TextEditingController category= TextEditingController();



  String initialValue ='Other';



  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      floatingActionButton: keyboardIsOpened?null:
      FloatingActionButton(
        child: Text('Back'),
        backgroundColor: color_p9,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
        },
      ),
      body:Container(
        padding: EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text("Add details here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: income,
                validator: (value) {
                  if(value!.isEmpty){
                    return "please enter Source";
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

                  hintText: 'Source of Income',
                  prefixIcon:Icon(Icons.account_balance_wallet,
                    color: color_gray14,
                  ),

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
                controller:amount,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if(value!.isEmpty){
                    return "please enter amount";
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

                  hintText: 'Amount',
                  prefixIcon: Icon(Icons.currency_rupee,
                    color: color_gray14,
                  ),

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
              DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: color_gray10,

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
                validator: (value) {
                  if(value!.isEmpty){
                    return "please select Category";
                  }
                  else{
                    return null;
                  }

                },

                items: incomeIcon.keys

                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Icon(incomeIcon[e],
                          color: incomeColor[e],

                        ),
                        SizedBox(width: 15),
                        Text(e),
                      ],

                    ),

                  ),
                )
                    .toList(),
                value: initialValue,
                onChanged: (newValue) {
                  setState(() {
                    initialValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: date,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Please select Date";
                  }
                  else{
                    return null;
                  }
                },
                readOnly: true,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: color_gray10,
                  hintText: 'Date',
                  prefixIcon: Icon(Icons.calendar_month,
                    color: color_gray14,
                  ),
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
                onTap:()async{
                  DateTime ?pickeddate= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2222));
                  //String formateddate = DateFormat("yyyy-mm-dd").format(pickeddate!);
                  if(pickeddate!=null){
                    date.text = DateFormat("dd-MM-yyyy").format(pickeddate);
                  }
                },
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  details.add(Income(title: income.text,amount: double.parse(amount.text),date: date.text,category: initialValue.toString()));
                  setState(()  {
                  });
                  print(details.toString());
                  // print("Expense :" +expense.text);
                  // print("Amount :" +amount.text);
                  // print("Category:" +initialValue);
                  //print("Date:" +date.text);


                  //   Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => BottomNavigation()));
                }


                else{
                  print('details not entered');

                }
              },

                // showDialog(context: context, builder: (context){
                //   return Container(
                //     child: AlertDialog(
                //       title: Text('Class Added',
                //       ),
                //       actions: [
                //         TextButton(onPressed:(){
                //           Navigator.pop(context);
                //         }, child: Text('OK'))
                //       ],
                //     ),
                //   );
                //
                // });




                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: color_p9,
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

                child: ListView.builder(
                  itemCount: details.length,
                  itemBuilder: (BuildContext context, int Index){
                    return Text(details[Index].title.toString()+"\n"+details[Index].amount.toString()+"\n"+details[Index].date.toString());
                  },
                ),
              ),




            ],
          ),
        ),
      ),

    );
  }

}

