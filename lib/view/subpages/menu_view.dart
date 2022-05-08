import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    final projectToView =
        ModalRoute.of(context)!.settings.arguments as OneProject;

    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *
            0.4), // here the desired height
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          flexibleSpace: Image.network(
            projectToView.image,
            fit: BoxFit.fill,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                      projectToView.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  Text(projectToView.description),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  try {
                    launchUrl(Uri(
                      scheme: 'tel',
                      path: projectToView.phone,
                    ));
                  } catch (e) {
                    throw 'Could not place call';
                  }
                },
                child: Text('Call ' + projectToView.phone),
                style: ElevatedButton.styleFrom(primary: Colors.black)
            ),
          ],
        ),
      ),
    );
  }
}

class OneProject {
  final String name;
  final String description;
  final String price;
  final String phone;
  final String image;
 
  OneProject(this.name, this.description, this.phone, this.price,this.image);
}
