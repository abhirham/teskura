import 'package:flutter/material.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/data/item.dart';

final List<Item> arr = [
  Item('Milk', false),
  Item('Eggs', false),
  Item('Curd', false),
  Item('Rice', false),
  Item('Bread', false),
];

class ItemsListScreen extends StatefulWidget {
  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Stack(
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: kCustomGreenColor,
            child: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          Positioned(
            left: 30.0,
            top: 30.0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xffff532f),
              child: Text(
                '10',
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: arr.length + 15,
          itemBuilder: (_, index) {
            if (index == arr.length) {
              return Divider(
                thickness: 1,
              );
            }
            if (index == arr.length + 1) {
              return Center(child: Text('History'));
            }

            if (index > arr.length) {
              return ListTile(
                leading: Icon(Icons.receipt),
                title: Text('10 Dec 1994'),
                onTap: () {},
              );
            }

            return CheckboxListTile(
              value: arr[index].completed,
              title: Text(arr[index].title),
              onChanged: (val) {
                arr[index].toggleChecked(val);
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }
}
