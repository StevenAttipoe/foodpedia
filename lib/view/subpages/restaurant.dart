import 'package:flutter/material.dart';
import 'package:foodpedia/view/widgets/restaurant_card.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({Key? key}) : super(key: key);

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios, size: 30),
                  ),
                  const Text("Popular Restaurant"),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search',
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Table(children: <TableRow>[
                  TableRow(children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0))
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0))
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0))
                  ]),
                  TableRow(children: <Widget>[
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0)),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: restaurantCard('Vine', 4.0))
                  ]),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
