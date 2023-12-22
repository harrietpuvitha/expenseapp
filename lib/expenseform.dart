


import 'package:expense_tracker/BottomNavigation.dart';
import 'package:expense_tracker/Icons.dart';
import 'package:expense_tracker/home1.dart';
import 'package:expense_tracker/widgets/expenseObject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'Expensecategory.dart';
import 'color.dart';

ValueNotifier<List<Expense>>expenseList=ValueNotifier([]);

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({Key? key}) : super(key: key);

  @override
  State<ExpenseForm> createState() => _ExpenseForm();
}

class _ExpenseForm extends State<ExpenseForm> {
  //List<Expense>details=[];
  TextEditingController date= TextEditingController();
  TextEditingController expense= TextEditingController();
  TextEditingController amount= TextEditingController();
  TextEditingController category= TextEditingController();
  //ValueNotifier<List<String>> expensecategoryList = ValueNotifier(expenseList.value);
  ValueNotifier<List<IconData>> expenseiconsList = ValueNotifier(expenseicon.value);
  ValueNotifier<List<Color>> expensecolorsList = ValueNotifier(expensecolors.value);


  String initialValue ='Other';



  final formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      floatingActionButton: keyboardIsOpened?null:
      FloatingActionButton(
        child: Text('Back',
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: color_p9,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigation()));
        },
      ),

      body:SingleChildScrollView(

        padding: EdgeInsets.all(20),
        child:Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),

              Text("Add details here",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30,),
              TextFormField(
                controller: expense,
                validator: (value) {
                  if(value!.isEmpty){
                    return "please enter Title";
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

                  hintText: 'Title of Expense',
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
              ValueListenableBuilder(
                valueListenable: expenseCategoryList,
                builder: (context,value,child) {
                  return DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: color_gray10,

                      hintStyle: TextStyle(
                        color: primaryColor2,
                      ),
                      focusedBorder: OutlineInputBorder(
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
                      if (value!.isEmpty) {
                        return "please select Category";
                      }
                      else {
                        return null;
                      }
                    },

                    // items: icons.keys
                    //
                    //     .map(
                    //       (e) =>
                    //       DropdownMenuItem(
                    //         value: e,
                    //         child: Row(
                    //           children: [
                    //             Icon(icons[e],
                    //               color: colors[e],
                    //
                    //             ),
                    //             SizedBox(width: 15,),
                    //             Text(e),
                    //           ],
                    //
                    //         ),
                    //
                    //       ),
                    // )
                    //
                    //     .toList(),
                    // value: initialValue,
                    // onChanged: (newValue) {
                    //   setState(() {
                    //     initialValue = newValue!;
                    //   });
                    // },
                    value: initialValue,
                    items: expenseCategoryList.value.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Row(
                          children: [
                            Text(e.toString()),
                          ],
                        ),
                      );
                    })
                        .toList(),

                    onChanged: (newValue) {
                      // expenseCategoryList.value.add(expenseCategoryList.value.toString());
                      // expenseiconsList.value.add(Icons.confirmation_number_sharp);
                      // expensecolorsList.value.add(Colors.redAccent);
                      // expenseCategoryList.notifyListeners();
                      initialValue=newValue! ;

                      //initialValue = newValue!;
                    },


                  );

                }
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
                  expenseList.value.add(Expense(title: expense.text,amount: int.parse(amount.text),category: initialValue.toString(),date: date.text));

                  formKey.currentState?.reset();
                  amount.clear();
                  expense.clear();
                  category.clear();
                  initialValue ='Other';
                  date.clear();
                  setState(() {

                  });

                  print(expense.value.toString());
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
        //    ListView.builder(
        //         shrinkWrap: true,
        //       physics: NeverScrollableScrollPhysics(),
        //
        //       itemCount: details.length,
        //       itemBuilder: (BuildContext context, int Index) {
        //       return Text(details[Index].title.toString() + "\n" + details[Index].amount.toString() + "\n" +
        //       details[Index].category.toString()+ "\n" + details[Index].date.toString());
        //
        //   },
        // ),






            ],
          ),
        ),
      ),




    );
  }

}

