import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTx;

  NewTransactions(this.addTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enterTile = titleController.text;
    final enterAmount = int.parse(amountController.text);

    if (enterTile.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(titleController.text, int.parse(amountController.text), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
      print(_selectedDate);

    });


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
            ),
            controller: titleController,
            onChanged: (val) {
              // titleInput= val;
            },
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Amount',
            ),
            controller: amountController,
            onChanged: (val) {},
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_selectedDate == null
                    ? 'No Date Chosen'
                    :
                        'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text("ADD TRANSACTION"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
