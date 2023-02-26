import 'package:flutter/material.dart';

class Transaction {
  final String imageUrl;
  final String date;
  final String purpose;
  final String amount;

  Transaction(this.imageUrl, this.date, this.purpose, this.amount);
}

class TransactionPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        'https://slideplayer.com/slide/14285342/89/images/3/SAMPLE+BILL+%E2%80%93+BEFORE+AID.jpg',
        '2022-01-01',
        'Tution, Room and Board',
        '28000 (2800 CEL)'),
    Transaction(
        'https://ak.picdn.net/shutterstock/videos/1068713471/thumb/1.jpg',
        '2022-01-02',
        'Laptop',
        '2000 (200 CEL)'),
 
  ];

  void _showImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Image.network(imageUrl),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redemtion History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: GestureDetector(
              onTap: () => _showImage(context, transactions[index].imageUrl),
              child: Image.network(transactions[index].imageUrl),
            ),
            title: Text(transactions[index].purpose),
            subtitle: Text(transactions[index].date),
            trailing: Text('\$${transactions[index].amount}'),
          );
        },
      ),
    );
  }
}
