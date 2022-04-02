import 'package:flutter/material.dart';
import './UI/transaction.dart';

void main(){
  runApp(
    MaterialApp(
      home: Expenses(),
    )
  );
}

class Expenses extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ExpensesState();
  }

}

class ExpensesState extends State<Expenses>{
  final List<Transaction> transaction = [
    Transaction(id: 't1', title: 'Shoe', amount: 6000, date: DateTime.now()),
    Transaction(id: 't1', title: 'Bag', amount: 3000, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white30,
     appBar: AppBar(
       backgroundColor: Colors.black,
       title: Text('EXPENSES TRACKER'),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(5),
       )),
       leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
       actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.add)),

       ],
     ),
     body: Column(
       children: [
         Card(
           child: Container(
             margin: EdgeInsets.all(20),
             width: double.infinity,
             child: Text('CHART', style: TextStyle(fontSize: 50),),),
           elevation: 10,
         ),
         Column(
           children: transaction.map((tx) {
             return Card(
               child: Row(
                 children: [
                   Container(
                     decoration: BoxDecoration(
                       border: Border.all( color: Colors.purple, width: 6,)
                     ),
                     margin: EdgeInsets.all(10),
                     padding: EdgeInsets.fromLTRB(20, 10, 10,10),
                     //color: Colors.lightGreen,
                     height: 80,
                     width: 200,
                     child: Text( '\$'+tx.amount.toString(), style: TextStyle( fontSize: 50, color: Colors.purple),),

                   ),
                   Column(
                     children: [
                       Text(tx.title, style: TextStyle( fontSize: 50)),
                       Text(tx.date.toString(), style: TextStyle( fontSize: 15))
                     ],

                   )
                 ],
               )
             );
           }).toList(),
         ),
       ],
     ),

   );
  }

}