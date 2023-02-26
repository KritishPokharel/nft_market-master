import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  Transaction({required this.title, required this.description, required this.price, required this.imageUrl});
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(title: 'Angat Pathak', description: 'Incoming Howard Student', price: '1000 CEL', imageUrl: 'images/1.png'),
    Transaction(title: 'Ankur Gyawali', description: 'Cost Cover to compete in olympiad', price: '10 CEL', imageUrl: 'images/3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performed Transactions'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transactions[index].imageUrl),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transactions[index].description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transactions[index].price,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
