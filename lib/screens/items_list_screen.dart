import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teskura/data/data.dart';
import 'package:teskura/utilities/constants.dart';
import 'package:teskura/models/item.dart';
import 'package:teskura/models/room.dart';
import 'package:teskura/services/db.dart';

class ItemsListScreen extends StatefulWidget {
  final Room room;

  ItemsListScreen(this.room);

  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  @override
  void initState() {
    context.read<Data>().selectedRoom = widget.room;

    super.initState();
  }

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
        child: ListViewWrapper(),
      ),
    );
  }
}

class ListViewWrapper extends StatefulWidget {
  @override
  _ListViewWrapperState createState() => _ListViewWrapperState();
}

class _ListViewWrapperState extends State<ListViewWrapper> {
  final DbService _db = DbService();
  Room _room;

  @override
  void initState() {
    setState(() {
      _room = context.read<Data>().selectedRoom;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_room.name == "Personal") {
      return RenderPersonalList();
    }

    return StreamProvider<List<Item>>.value(
      initialData: [],
      value: _db.fetchItemsStream(_room.id),
      child: Consumer<List<Item>>(
        builder: (_, itemsList, __) => ItemsList(itemsList),
      ),
    );
  }
}

class RenderPersonalList extends StatefulWidget {
  @override
  _RenderPersonalListState createState() => _RenderPersonalListState();
}

class _RenderPersonalListState extends State<RenderPersonalList> {
  @override
  void initState() {
    context.read<Data>().fetchItems(context.read<Data>().selectedRoom.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (_, data, __) {
        return ItemsList(data.itemsList);
      },
    );
  }
}

class ItemsList extends StatelessWidget {
  final List<Item> itemsList;

  ItemsList(this.itemsList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemsList.length,
      itemBuilder: (_, index) {
        return CheckboxListTile(
          value: itemsList[index].pickedUp,
          title: Text(itemsList[index].name),
          onChanged: (val) {
            context.read<Data>().updateItem(itemsList[index], val);
          },
        );
      },
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
