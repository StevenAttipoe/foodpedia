import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/nav/home.dart';
import 'package:foodpedia/view/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Form(
            key: _loginFormKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                Image.asset(
                  'assets/icons/foodpedia.png',
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2))
                        ]),
                    height: 60,
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.email, color: Color(0xffffffff)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2))
                        ]),
                    height: 60,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(Icons.lock, color: Color(0xffffffff)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_loginFormKey.currentState!.validate()) {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text.toString().trim(),
                            password:
                                _passwordController.text.toString().trim());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Don't have an account? ",
                style: TextStyle(fontSize: 17)),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: const Text('Sign up!', style: TextStyle(fontSize: 17)),
            )
          ])
        ],
      )),
    );
  }
}
