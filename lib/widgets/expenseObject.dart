class Expense{

  final String title;
  final int amount;
  final String date;
  final String category;


  Expense({

    required this.title,
    required this.amount,
    required this.date,
    required this.category,

});

  // Map<String,dynamic>toMap()=>{
  //   'title':title,
  //   'amount':amount.toString(),
  //   'date': date.toString(),
  //   'category':category,
  // };
  //
  // factory Expense.fromString(Map<String,dynamic>value)=>Expense(
  //     id: value['id'],
  //     title: value['title'],
  //     amount: value['amount'],
  //     date: value['date'],
  //     category: value['category'],
  // );
}
