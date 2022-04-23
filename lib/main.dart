import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './UI/transaction_list.dart';
import './widgets/transaction.dart';

void main() {
  runApp(MaterialApp(
    title: 'Personal Expense',
    theme: ThemeData(
      primarySwatch: Colors.green,
      primaryColor: Colors.green,
      fontFamily: 'Quicksand',
      appBarTheme: AppBarTheme( titleTextStyle: TextStyle( fontFamily: 'Opensans', fontSize: 20, fontWeight: FontWeight.bold)
      )
    ),
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

  final List<Transaction> _userTransaction = [
    // Transaction(id: 't1', title: 'Shoe', amount: 6000, date: DateTime.now()),
    // Transaction(id: 't1', title: 'Bag', amount: 3000, date: DateTime.now())
  ];
  List<Transaction> get recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();

  }

  void _addNewTransaction( String title, int amount){
    final newTx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransactions(_addNewTransaction);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('EXPENSES TRACKER', style: TextStyle(fontFamily: 'Opensans'),),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        )),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed:() => _startAddNewTransaction(context), icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(child:Column(
        children: [
          Chart(recentTransactions: recentTransactions),

          // Card(
          //
          //    child: Container(
          //   //   margin: EdgeInsets.all(20),
          //   //   width: double.infinity,
          //   //   child: Text(
          //   //     'CHART',
          //   //     style: TextStyle(fontSize: 20, fontFamily: 'Opensans'),
          // //   //   ),
          // //   // ),
          //   elevation: 5,
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          TransactionList(_userTransaction),
        ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),

    );
  }
}
