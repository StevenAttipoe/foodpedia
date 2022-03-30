import 'package:flutter/material.dart';
import 'package:foodpedia/view/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [

                SearchBar(),
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
                ),
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
                ),
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
                ),
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
                ),
              ],),
            ),
          ),
    );
  }
}
