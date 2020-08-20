import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/data/tasks.dart';

class ItemsListScreen extends StatefulWidget {
  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FabWithNumber(),
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
        child: Consumer<Tasks>(
          builder: (_, itemsData, __) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: itemsData.itemCount,
              itemBuilder: (_, index) {
                if (index == itemsData.itemCount) {
                  return Divider(
                    thickness: 1,
                  );
                }
                if (index == itemsData.itemCount + 1) {
                  return Center(child: Text('History'));
                }

                if (index > itemsData.itemCount) {
                  return ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text('10 Dec 1994'),
                    onTap: () {},
                  );
                }

                return CheckboxListTile(
                  value: itemsData.items[index].completed,
                  title: Text(itemsData.items[index].title),
                  onChanged: (val) {
                    itemsData.updateItem(itemsData.items[index],
                        !itemsData.items[index].completed);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FabWithNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
