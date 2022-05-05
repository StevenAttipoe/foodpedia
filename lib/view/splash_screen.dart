import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/login.dart';
import 'package:foodpedia/view/nav/home.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeAppFirebase();
    _navigateToLogin();
    WidgetsFlutterBinding.ensureInitialized();
  }

  initializeAppFirebase() async {
    await Firebase.initializeApp();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height *0.15),
          Image.asset(
            'assets/icons/foodpedia.png',
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            color: Color.fromARGB(255, 170, 170, 170),
          )
        ],
      )),
    );
    
  }
}
