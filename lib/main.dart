import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import './UI/transaction_list.dart';
import './widgets/user_transactions.dart';

void main() {
  runApp(MaterialApp(
    home: Expenses(),
  ));
}

class Expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpensesState();
  }
}

class ExpensesState extends State<Expenses> {
  // late String titleInput;
  // late String amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('EXPENSES TRACKER'),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        )),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              child: Text(
                'CHART',
                style: TextStyle(fontSize: 20),
              ),
            ),
            elevation: 5,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          UserTransactions()
        ],
      ),
    ),
    );
  }
}
