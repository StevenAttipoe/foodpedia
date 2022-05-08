import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/login.dart';
import 'package:foodpedia/view/subpages/update_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _feed = FirebaseFirestore.instance;

  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  late List userData = [];
  late QuerySnapshot querySnapshot;

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: RefreshIndicator(
               onRefresh: () {
                return Future.delayed(Duration(seconds: 1), () {
                  getUserDetails();
                });
                },
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                     child: SingleChildScrollView(
                     physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/icons/foodpedia.png'),
                              radius: 50.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                (userData.isEmpty)
                                    ? "Hello User!"
                                    : "Hello " + userData[0]['fullName'] + " !",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                                (userData.isEmpty)
                                    ? "Contact!"
                                    : userData[0]['phone'],
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                                (userData.isEmpty)
                                    ? "Email!"
                                    : userData[0]['email'],
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: [
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                  child: const Text('Sign Out'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => (userData
                                                    .isEmpty)
                                                ? UpdateProfile(
                                                    "Username", "Phone number")
                                                : UpdateProfile(
                                                    userData[0]["fullName"],
                                                    userData[0]["phone"])));
                                  },
                                  child: const Text('Update Profile'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ]),
                    ))))));
  }

  Future<void> getUserDetails() async {
    querySnapshot =
        await _feed.collection('users').doc(uid).collection('info').get();

    setState(() {
      userData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
