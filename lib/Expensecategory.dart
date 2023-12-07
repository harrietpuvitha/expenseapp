import 'package:expense_tracker/color.dart';
import 'package:flutter/material.dart';


class ExpenseCategory extends StatefulWidget {
  const ExpenseCategory({Key? key}) : super(key: key);

  @override
  State<ExpenseCategory> createState() => _ExpenseCategoryState();
}
TextEditingController ctrTitle= TextEditingController();
List<String>title=[
  "Transport",
  "Sports",
  "Gift",
  "Food And Drinks'",
  "Entertainment",
  "Education",
  "Family",
  "Hospital",
  "Other",
];
List<IconData>icon=[Icons.directions_train_outlined,Icons.sports_soccer,Icons.card_giftcard,Icons.local_pizza,Icons.movie,Icons.school,
  Icons.family_restroom_rounded,
  Icons.local_hospital,
  Icons.miscellaneous_services,
];
List<Color>colors=[
  Colors.purple,
  Colors.yellow,
  Colors.blueAccent,
  Colors.deepOrange,
  Colors.pink,
  Colors.green,
  Colors.red,
  Colors.brown,
  Colors.indigo,
];
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
                  setState(() {
                    title.add(ctrTitle.text.toString());
                    icon.add(Icons.confirmation_number_sharp);
                    colors.add(Colors.redAccent);

                    Navigator.pop(context);
                  });
                }, child: Text("Add"))

              ],
            );
          } );

        },
        child: Icon(Icons.add),

      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio:1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0),
        itemCount: icon.length,
        itemBuilder: (BuildContext context, int Index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon[Index],
                  color: colors[Index],
                  size: 40,
                  shadows: [Shadow(
                      blurRadius: 20,
                      offset: Offset(3, 6),
                      color: colors[Index]
                  )],
                ),
                SizedBox(height: 8,),
                Center(
                  child: Text(
                    title[Index].toString(),
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
      ),
    );
  }
}
