import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {

  final Function addTx;


  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {

    if (amountController.text == "") {
      return;
    }

    final enterdTitle = titleController.text;
    final enteredAmount =  double.parse(amountController.text);

    if (enterdTitle.isEmpty || enteredAmount <= 0) {
        return;
    }

    widget.addTx(enterdTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Align(
                alignment: Alignment.centerRight,
                  child: Text('Add Transaction')
              ),
              textColor: Colors.purple,
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
