import 'package:expense_tracker/color.dart';
import 'package:flutter/material.dart';


class ExpenseCategory extends StatefulWidget {
  const ExpenseCategory({Key? key}) : super(key: key);

  @override
  State<ExpenseCategory> createState() => _ExpenseCategoryState();
}
TextEditingController ctrTitle= TextEditingController();
ValueNotifier<List<String>> expenseCategoryList = ValueNotifier<List<String>>([
  "Transport",
  "Sports",
  "Gift",
  "Food And Drinks'",
  "Entertainment",
  "Education",
  "Family",
  "Hospital",
  "Other",
]);
// List<String>title=[
//   "Transport",
//   "Sports",
//   "Gift",
//   "Food And Drinks'",
//   "Entertainment",
//   "Education",
//   "Family",
//   "Hospital",
//   "Other",
// ];
ValueNotifier<List<IconData>>expenseicon=ValueNotifier<List<IconData>>([Icons.directions_train_outlined,Icons.sports_soccer,Icons.card_giftcard,Icons.local_pizza,Icons.movie,Icons.school,
  Icons.family_restroom_rounded,
  Icons.local_hospital,
  Icons.miscellaneous_services,
]);
ValueNotifier<List<Color>>expensecolors=ValueNotifier<List<Color>>([
  Colors.purple,
  Colors.yellow,
  Colors.blueAccent,
  Colors.deepOrange,
  Colors.pink,
  Colors.green,
  Colors.red,
  Colors.brown,
  Colors.indigo,
]);
String input ="";
class _ExpenseCategoryState extends State<ExpenseCategory> {
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
                  expenseCategoryList.value.add(ctrTitle.text.toString());
                    expenseicon.value.add(Icons.confirmation_number_sharp);
                    expensecolors.value.add(Colors.redAccent);
                  expenseCategoryList.notifyListeners();
                    Navigator.pop(context);
                    ctrTitle.clear();

                }, child: Text("Add"))

              ],
            );
          } );

        },
        child: Icon(Icons.add,
          color: Colors.white,
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: expenseCategoryList,
                builder: (context,value,child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemCount: expenseicon.value.length,
              itemBuilder: (BuildContext context, int Index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(expenseicon.value[Index],
                        color: expensecolors.value[Index],
                        size: 40,
                        shadows: [Shadow(
                            blurRadius: 20,
                            offset: Offset(3, 6),
                            color: expensecolors.value[Index]
                        )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Center(
                        child: Text(
                          value[Index].toString(),
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
            );
                }
            ),
          ),
        ],
      ),
    );
  }
}
