import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/model/user.dart';
import 'package:foodpedia/view/widgets/restaurant_card.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';

class Restaurants extends StatefulWidget {
  Restaurants(this.restaurantData, this.index, {Key? key}) : super(key: key);
  late List restaurantData;
  late int index;

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  List<TableRow> restaurantRows = [];
   String reservedDate = "";
   String reservedTime = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.4), // here the desired height
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xff99879D),
          ),
          flexibleSpace: Image.network(
            widget.restaurantData[widget.index]['image'],
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.restaurantData[widget.index]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(width: 20),
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 17,
                              ),
                              Text(
                                widget.restaurantData[widget.index]['ratings'],
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Text(
                            widget.restaurantData[widget.index]['price'],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          widget.restaurantData[widget.index]['description'],
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Reservations",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 13),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: DateTimePicker(
                              initialValue: '',
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              // icon: const Icon(Icons.calendar_month_outlined),
                              decoration: const InputDecoration(
                                  labelText: 'Date',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  )),
                              onChanged: (val) => setState(() {
                                  reservedDate = val;
                                }),
                              validator: (val) {
                                if (val == null|| val.isEmpty) {
                                    return 'Date is required';
                                  }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 50),
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: DateTimePicker(
                              type: DateTimePickerType.time,
                              initialValue: '',
                              icon: const Icon(Icons.access_time),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              decoration: const InputDecoration(
                                  labelText: 'Time',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                  )),
                              onChanged: (val) => 
                                setState(() {
                                  reservedTime = val;
                                }),
                              validator: (val) {
                                 if (val == null|| val.isEmpty) {
                                    return 'Time is required';
                                  }
                                return null;
                              },
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          reserveDialog(
                            context,
                            reservedTime,
                            reservedDate,
                            widget.restaurantData[widget.index]['name']
                          );
                        },
                        child: const Text('Reserve Table'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                      const Spacer(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void reserveDialog(context, String time, String date, String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Reserve a Table at '+ name + " !"),
          content:  SingleChildScrollView(
            child: Text('Are you sure you want to reserve at table on the '+ date +" at "+ time +" ?"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                reserverRestaurant(time, date, name);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
