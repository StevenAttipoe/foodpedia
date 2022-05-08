import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/subpages/restaurant.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _feed = FirebaseFirestore.instance;
  late List restaurantData = [];
  late QuerySnapshot querySnapshot;
  String searchString = "";

  @override
  void initState() {
    super.initState();
    getRestaurantData();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchString = value.toLowerCase();
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search, size: 37),
                    )),
              ),
              (restaurantData.isEmpty)
                  ? const CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        color: Color.fromARGB(255, 170, 170, 170),
                      )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: restaurantData.length,
                      itemBuilder: (context, index) {
                        return restaurantData[index]['name']
                                .toLowerCase()
                                .contains(searchString)
                               
                            ? GestureDetector(
                              onTap: () {
                                 Navigator.push( context,
                                    MaterialPageRoute(
                                      builder: (context) =>  Restaurants(restaurantData,index)));
                              },
                              child:
                                Container(
                                    margin:const EdgeInsets.only(left: 10, top: 20),
                                    width: MediaQuery.of(context).size.width * .95,
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Image.network(
                                              restaurantData[index]['image'],
                                            ),
                                          ),
                                         Flexible(
                                           child: 
                                            Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Text(
                                                  restaurantData[index]['name'],
                                                  style:  const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                  ),
                                                const SizedBox(height: 15),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                                  child: Text(
                                                    restaurantData[index]['description'],
                                                    maxLines: 4,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        restaurantData[index]['price'],
                                                    ),
                                                      Wrap(
                                                        direction: Axis.horizontal,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            restaurantData[index]['ratings'],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            )
                                         )
                                        ],
                                      ),
                                    ),
                            )
                            : const Text("");
                      }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getRestaurantData() async {
    querySnapshot = await _feed.collection('restaurants').get();

    setState(() {
      restaurantData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
