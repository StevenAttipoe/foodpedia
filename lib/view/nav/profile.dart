import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
          Container(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/icons/foodpedia.png'),
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Morgan",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                      ),                     
                      const Text(
                        "I don't regret using Steven's services!",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const Login()));
                        },
                        child: const Text('Sign Out'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                    ]
                )
              )
            )
          )
      )
    );
  }
}