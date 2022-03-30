import 'package:flutter/material.dart';
import 'package:foodpedia/model/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchBar extends StatefulWidget {
  const SearchBar({ Key? key }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchString = "";
  late Future<List<Show>> shows;

  @override
  void initState() {
    super.initState();
    shows = fetchShows();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
        ),
        Flexible(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot<List<Show>> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return snapshot.data![index].title
                              .toLowerCase()
                              .contains(searchString)
                          ? ListTile(
                              leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                    '${snapshot.data?[index].imageUrl}'),
                              ),
                              title: Text('${snapshot.data?[index].title}'),
                              subtitle: Text(
                                  'Score: ${snapshot.data?[index].score}'),
                            )
                          : Container();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return snapshot.data![index].title
                              .toLowerCase()
                              .contains(searchString)
                          ? Divider()
                          : Container();
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Something went wrong :('));
              }
              return CircularProgressIndicator();
            },
            future: shows,
          ),
        ),
        ]
    );
  }
}

Future<List<Show>> fetchShows() async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));

  if (response.statusCode == 200) {
    var topShowsJson = jsonDecode(response.body)['top'] as List;
    return topShowsJson.map((show) => Show.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load shows');
  }
}