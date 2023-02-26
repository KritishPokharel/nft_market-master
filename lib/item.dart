import 'package:flutter/material.dart';

class Item {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  Item({required this.name, required this.description, required this.price, required this.imageUrl});
}

class ItemList extends StatelessWidget {
  final List<Item> items = [    Item(name: 'Packet 1', description: 'Pack of 1 CEL', price: '1 CEL (\$n10)', imageUrl: 'images/img.jpg'),    
  Item(name: 'Packet 2', description: 'Pack of 10 CEL', price: '10 CEL (\$n100)', imageUrl: 'images/img.jpg'),    
  Item(name: 'Packet 3', description: 'Pack of 100 CEL', price: '100 CEL (\$n1000)', imageUrl: 'images/img.jpg'),  
    Item(name: 'Packet 4', description: 'Pack of 1000 CEL', price: '1000 CEL (\$n10000)', imageUrl: 'images/img.jpg'),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Items'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(items[index].imageUrl),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        items[index].description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                    Text(
                        items[index].price,
                        style: TextStyle(fontSize: 16),
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
