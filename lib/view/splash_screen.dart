import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:foodpedia/view/login.dart';

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
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context)=>Login()));
  }

  @override
  Widget build(BuildContext context) {
    return 
      new SplashScreen(
        seconds: 10,
        image: new Image.asset('assets/icons/foodpedia.png'),
        backgroundColor: Colors.white,
        photoSize: 150.0,
        loaderColor: Colors.black,);
    
  }
}