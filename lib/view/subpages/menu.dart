import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';


class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _feed = FirebaseFirestore.instance;
  late List menuData = [];
  late QuerySnapshot querySnapshot;
  String searchString = "";

  @override
  void initState() {
    super.initState();
    getMenuData();
  }

  void dispose() {
    super.dispose();
  }

   Future<void> getMenuData() async {
    querySnapshot = await _feed.collection('menus').get();

    setState(() {
      menuData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
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
              child: Container(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                                suffixIcon: Icon(Icons.search,size: 37),
                          )
                        ),
                    ),
                   (menuData.isEmpty)
                        ? const Padding(
                            padding: EdgeInsets.only(top: 40.0),
                            child: Text("No Menu Available"),
                          )
                        : 
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: menuData.length,
                        itemBuilder: (context, index) {
                          return menuData[index]['name']
                            .toLowerCase()
                            .contains(searchString)
                          ? ListTile(
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
                          ): Text("");
                        }),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}