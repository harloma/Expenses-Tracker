import 'package:flutter/material.dart';
import '../widgets/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;


  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions',
                  style: TextStyle(fontFamily: 'Opensans', fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  child: Image.asset(
                    'Asset/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transaction[index].id),
                      icon: Icon(Icons.delete_forever_sharp),
                      color: Colors.red,
                    ),
                  ),
                );
              },
              itemCount: transaction.length,

              //     children: [Column(
              //     children: transaction.map((transaction[index]) {
              //       return
              //     }).toList(),
              //   ),
              // ],
            ),
    );
  }
}
