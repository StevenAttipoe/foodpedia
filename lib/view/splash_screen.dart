import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context)=> const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: SplashScreen(
          seconds: 10,
          image:  Image.asset('assets/icons/foodpedia.png'),
          backgroundColor: Colors.white,
          photoSize: 150.0,
          loaderColor: Colors.black,),
       );
    
  }
}
