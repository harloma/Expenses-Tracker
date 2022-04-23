import 'package:flutter/material.dart';
import '../widgets/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child:  transaction.isEmpty ? Column(
        children: [
          Text('No Transactions', style: TextStyle(fontFamily: 'Opensans', fontSize: 30),),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250,
            child: Image.asset('Asset/images/waiting.png', fit: BoxFit.cover,),
          )

        ],
      )
     : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //color: Colors.blueAccent,
                    decoration: BoxDecoration(
                        // border: Border.all(
                        //   //color: Colors.green,
                        //   width: 2,
                        // ),
                      color: Colors.green
                    ),
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    height: 30,
                    width: 100,
                    child: Text(
                      '\$' + transaction[index].amount.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Column(

                    children: [
                      Text(transaction[index].title, style: TextStyle(fontSize: 15)),
                      Text(DateFormat.yMMMd().format(transaction[index].date),
                          style: TextStyle(fontSize: 13))
                    ],
                  ),
                  SizedBox(
                    //width: 80,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever), iconSize: 25, color: Colors.red,)
                ],
              ),
          );},
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
