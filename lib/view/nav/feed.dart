import 'package:flutter/material.dart';
import 'package:foodpedia/view/subpages/menu.dart';
import 'package:foodpedia/view/subpages/restaurant.dart';
import 'package:foodpedia/view/widgets/restaurant_card.dart';


class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.fastfood, size: 30),
                    Text("Hello, Steven!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Icon(Icons.notifications_active_outlined, size: 30),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 20),
                    width: MediaQuery.of(context).size.width * .95,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Image.asset(
                      'assets/img/burger.png',
                      width:56,
                      height:56,
                    )
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Popular Restaurant",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.pink,
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Restaurants()));
                          },
                          child: const Text('See all'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0,),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .20,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            restaurantCard('Vine',4.0),
                            restaurantCard('Bondia',3.0),
                            restaurantCard('Skybar',2.0),
                            restaurantCard('Skybar',2.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Popular Menu",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.pink,
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Menu()));
                          },
                          child: const Text('See all'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0,),
                      child: SingleChildScrollView(
                        child: Column( 
                          children:  [
                              ListTile(
                                leading: 
                                  Image.network(
                                    'https://www.seekapor.com/wp-content/uploads/2018/08/Konbini.com_.png',
                                    width:56,
                                    height:56,
                                  ),
                                title: Text('Jollof Rice'),
                                subtitle: Text('Local Ghanaian Jollof Rice'),
                                trailing:  Text('Ghc20.00'),
                              ),
                              ListTile(
                                leading: 
                                  Image.network(
                                    'https://eatwellabi.com/wp-content/uploads/2021/09/Waakye-13-720x538.jpg',
                                    width:56,
                                    height:56,
                                  ),
                                title: Text('Waakye'),
                                subtitle: Text('Hot fast foor for the morning'),
                                trailing:  Text('Ghc25.00'),
                              ),
                              ListTile(
                                leading: 
                                  Image.network(
                                    'https://img-global.cpcdn.com/recipes/5da646cc1c73a947/1200x630cq70/photo.jpg',
                                    width:56,
                                    height:56,
                                  ),
                                title: Text('Fried Rice'),
                                subtitle: Text('Hot local Ghanaian fried you just need to have an awesome day!'),
                                trailing:  Text('Ghc25.00'),
                              ),
                              ListTile(
                                leading: 
                                  Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSybQ7SfSQ8V5RCY_eTVz6M0yONf1AZUKbbuA&usqp=CAU',
                                    width:56,
                                    height:56,
                                  ),
                                title: Text('Assorted Rice'),
                                subtitle: Text(' Ghanaian Assorted Rice you need to try!'),
                                trailing:  Text('Gh30.00'),
                              ),
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
