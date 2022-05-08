import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/subpages/menu.dart';
import 'package:foodpedia/view/subpages/menu_view.dart';
import 'package:foodpedia/view/subpages/restaurant.dart';
import 'package:foodpedia/view/widgets/restaurant_card.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  var _feed = FirebaseFirestore.instance;

  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  late List userData = [];
  late List menuData = [];
  late List restaurantData = [];
  late QuerySnapshot querySnapshot;

  @override
  void initState() {
    super.initState();
    getUserName();
    getMenuData();
    getRestaurantData();
  }

  void dispose() {
    setState(() {
      userData = [];
    });
    super.dispose();
  }

  Future<void> getUserName() async {
    querySnapshot =
        await _feed.collection('users').doc(uid).collection('info').get();

    setState(() {
      userData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> getMenuData() async {
    querySnapshot = await _feed.collection('menus').get();

    setState(() {
      menuData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> getRestaurantData() async {
    querySnapshot = await _feed.collection('restaurants').get();

    setState(() {
      restaurantData = querySnapshot.docs.map((doc) => doc.data()).toList();
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 60, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.fastfood, size: 30),
                    Text(
                        (userData.isEmpty)
                            ? "Hello User!"
                            : "Hello " + userData[0]['fullName'] + " !",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: const[
                      Padding(
                        padding:  EdgeInsets.only(left: 15,top: 20),
                        child:  Text("Restaurant of the Week",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, top:10),
                      width: MediaQuery.of(context).size.width * .95,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: 
                      (restaurantData.isEmpty)
                        ? const Center(child: Text("Loading"))
                      : Image.network(
                        restaurantData[2]['image'],
                        width: 56,
                        height: 56,
                        fit: BoxFit.fill,
                      ))
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, top: 10.0),
              //   child: Stack(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           const Text("Popular Restaurant",
              //               style: TextStyle(
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.bold,
              //               )),
              //           TextButton(
              //             style: TextButton.styleFrom(
              //               primary: Colors.pink,
              //               textStyle: const TextStyle(
              //                   fontSize: 15, fontWeight: FontWeight.bold),
              //             ),
              //             onPressed: () {
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           Restaurants(restaurantData)));
              //             },
              //             child: const Text('See all'),
              //           )
              //         ],
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(
              //           top: 40.0,
              //         ),
              //         child: Container(
              //           height: MediaQuery.of(context).size.height * .20,
              //           child: (restaurantData.isEmpty)
              //               ? const Padding(
              //                   padding: EdgeInsets.only(top: 40.0),
              //                   child: Text("No Restaurants Available"),
              //                 )
              //               : ListView.builder(
              //                   scrollDirection: Axis.horizontal,
              //                   shrinkWrap: true,
              //                   itemCount: restaurantData.length,
              //                   itemBuilder: (context, index) {
              //                     return restaurantCard(
              //                         restaurantData[index]['name'],
              //                         restaurantData[index]['ratings'],
              //                         restaurantData[index]['image']);
              //                   }),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(left:5),
                          child:  Text("Popular Menu",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.pink,
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Menu()));
                          },
                          child: const Text('See all'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            (menuData.isEmpty)
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 40.0),
                                    child: Text("No Menu Available"),
                                  )
                                : const Text(""),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: menuData.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/menu',
                                        arguments: 
                                          OneProject(
                                            menuData[index]['name'].toString(),
                                            menuData[index]['description'].toString(),
                                            menuData[index]['phone'].toString(),
                                            menuData[index]['price'].toString(),
                                            menuData[index]['image'].toString()
                                          )
                                      );
                                    },
                                    child: ListTile(
                                      leading: Container(
                                        child: Image.network(
                                          menuData[index]['image'],
                                          width: 56,
                                          height: 56,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      title: Text(menuData[index]['name']),
                                      subtitle:
                                          Text(menuData[index]['description']),
                                      trailing: Text(menuData[index]['price']),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
