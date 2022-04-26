import 'package:expense_tracker/widgets/chart_Bar.dart';
import 'package:expense_tracker/widgets/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  // Chart({Key? key, required this.recentTransactions}) : super(key: key);
  Chart({required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          print(recentTransactions[i].amount);
          totalSum += recentTransactions[i].amount;
          print(DateFormat.E().format(weekDay));
          print(totalSum);
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0, (sum, item) {
      return sum + (item['amount'] as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(data['day'].toString(), (data['amount'] as int),
                  totalSpending==0 ? 0 :(data['amount'] as int) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
