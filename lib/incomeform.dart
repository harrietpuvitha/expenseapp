
import 'dart:ffi';
import 'package:table_calendar/table_calendar.dart';

import 'package:expense_tracker/Expensecategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'BottomNavigation.dart';
import 'Icons.dart';
import 'color.dart';
import 'incomeObject.dart';
import 'incomecategory.dart';


ValueNotifier<List<Income>>incomeList=ValueNotifier([]);

class IncomeForm extends StatefulWidget {
  //const IncomeForm({Key? key}) : super(key: key);


  @override
  State<IncomeForm> createState() => _IncomeForm();
}


class _IncomeForm extends State<IncomeForm> {
  //ValueNotifier<Income>details=ValueNotifier<Income>(Income(title: '', amount: double.parse(''), date: '', category: ''));


  TextEditingController date= TextEditingController();
  TextEditingController income= TextEditingController();
  TextEditingController amount= TextEditingController();
  TextEditingController category= TextEditingController();
  String initialValue ='Other';

  final formKey = GlobalKey<FormState>();
  //ValueNotifier<List<String>> incomecategoryList = ValueNotifier(incomeList.value);
  ValueNotifier<List<IconData>> incomeiconsList = ValueNotifier(iconList.value);
  ValueNotifier<List<Color>> incomecolorsList = ValueNotifier(colorList.value);




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
        child: Container(
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
                ValueListenableBuilder(
                    valueListenable: incomeCategoryList,
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
        
        
                        // items: incomeList.value
                        //
                        //     .map(
                        //       (e) =>
                        //       DropdownMenuItem(
                        //         value: e,
                        //         child: Row(
                        //           children: [
                        //             // Icon(iconList.value[e],
                        //             // color: colorsList[e],
                        //             // ),
                        //
                        //
                        //             SizedBox(width: 15),
                        //             Text(e),
                        //           ],
                        //
                        //         ),
                        //
                        //       ),
                        // )
                        //     .toList(),
                        value: initialValue,
                        items: incomeCategoryList.value.map((e) {
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
                          // incomecategoryList.value.add(incomeList.value.toString());
                          // incomeiconsList.value.add(Icons.confirmation_number_sharp);
                          // incomecolorsList.value.add(Colors.redAccent);
                          // incomeList.notifyListeners();
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
                    // TableCalendar(
                    //   headerVisible: false,
                    //   daysOfWeekVisible: false,
                    //   focusedDay: DateTime.now(),
                    //   firstDay: DateTime.now(),
                    //   lastDay: DateTime(DateTime.now().year, now.month + 1, 0).day, // This will return last day of current month
                    //   startingDayOfWeek: StartingDayOfWeek.monday,
                    //   availableGestures: AvailableGestures.none,
                    //   daysOfWeekHeight: 20,
                    // );
                    DateTime ?pickeddate= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000),
                        lastDate: DateTime.now());

                    //String formateddate = DateFormat("yyyy-mm-dd").format(pickeddate!);
                    if(pickeddate!=null){
                      date.text = DateFormat("dd-MM-yyyy").format(pickeddate);
                    }
                  },
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    incomeList.value.add(Income(title: income.text,amount: double.parse(amount.text),date: date.text,category: initialValue.toString()));
                    formKey.currentState?.reset();
                    amount.clear();
                    income.clear();
                    category.clear();
                    initialValue ='Other';
                    date.clear();
                    incomeList.notifyListeners();
                    setState(() {

                    });
        
                    print(incomeList.value.toString());
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
                // Expanded(
                //   child: ValueListenableBuilder(
                //     valueListenable: details,
                //     builder: (builder,value,child) {
                //       return ListView.builder(
                //         itemCount: details.value.length,
                //         itemBuilder: (BuildContext context, int Index) {
                //           return Text(details.value[Index].title.toString() +
                //               "\n" + details.value[Index].amount.toString() + "\n" +
                //               details.value[Index].date.toString());
                //         },
                //       );
                //     }
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),

    );
  }

}

