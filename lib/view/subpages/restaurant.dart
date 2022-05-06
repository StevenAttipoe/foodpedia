import 'package:flutter/material.dart';
import 'package:foodpedia/view/widgets/restaurant_card.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';

class Restaurants extends StatefulWidget {
  Restaurants(this.restaurantData, {Key? key}) : super(key: key);
  late List restaurantData;

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  List<TableRow> restaurantRows = [];

  @override
  void initState() {
    super.initState();
    createTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(children: restaurantRows)
            ],
          ),
        ),
      ),
    );
  }

  createTable() {
    List<TableRow> rows = [];
    for (int i = 0; i < widget.restaurantData.length-2; ++i) {
      rows.add(TableRow(children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: restaurantCard(
                widget.restaurantData[i]['name'],
                widget.restaurantData[i]['ratings'],
                widget.restaurantData[i]['image'])),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: restaurantCard(
                widget.restaurantData[i+1]['name'],
                widget.restaurantData[i+1]['ratings'],
                widget.restaurantData[i+1]['image']))
      ]));
    }
    setState(() {
      restaurantRows = rows;
    });
  }
}
