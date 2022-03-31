import 'package:flutter/material.dart';

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

   );
  }

}