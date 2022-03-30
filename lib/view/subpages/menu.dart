import 'package:flutter/material.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';


class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
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
                        const Text("Popular Menu"),
                      ],
                    ),
                   SearchBar(),
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
          ),
    );
  }
}