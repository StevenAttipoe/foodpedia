import 'package:flutter/material.dart';
import 'package:foodpedia/view/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
       child: Column(
        children: [
          Form(
            key: _signupFormKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/foodpedia.png',
                  width:200,
                  height:200,),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null|| value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_signupFormKey.currentState!.validate()) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? "),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text('Log in!'),
              )
            ]
          )
        ],
      )),
    );
  }
}