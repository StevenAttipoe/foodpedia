import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var _feed = FirebaseFirestore.instance;

  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  late List reservationData = [];
  late QuerySnapshot querySnapshot;

  @override
  void initState() {
    super.initState();
    getReservationData();
  }

  Future<void> getReservationData() async {
    querySnapshot = await _feed
      .collection('users')
      .doc(uid)
      .collection('reserve').get();

    setState(() {
      reservationData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("Reservations",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        (reservationData.isEmpty)
                            ? const Padding(
                                padding: EdgeInsets.only(top: 40.0),
                                child: Text("No Reservation Available"),
                              )
                            : const Text(""),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: reservationData.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(reservationData[index]['name']),
                                subtitle: Text(
                                  reservationData[index]['date'] +
                                   reservationData[index]['time']
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showDeleteDialog(context, index);
                                    },
                                    icon: const Icon(Icons.delete)),
                              );
                            }
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
void showDeleteDialog(context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Reservation'),
          content: const SingleChildScrollView(
            child: Text('Are you sure you want to cancel this reservation?'),
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
                querySnapshot.docs[index].reference.delete();
                getReservationData();
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
