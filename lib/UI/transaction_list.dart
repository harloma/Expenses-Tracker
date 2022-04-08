import 'package:flutter/material.dart';
import '../widgets/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transaction.map((tx) {
          return Card(
              child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.purple,
                  width: 3,
                )),
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //color: Colors.lightGreen,
                height: 30,
                width: 100,
                child: Text(
                  '\$' + tx.amount.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.purple),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(

                children: [
                  Text(tx.title, style: TextStyle(fontSize: 15)),
                  Text(DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(fontSize: 13))
                ],
              )
            ],
          ));
        }).toList(),
      ),
    );
  }
}
