import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/model/user.dart';
import 'package:foodpedia/view/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    initializeAppFirebase();
  }

  initializeAppFirebase() async {
    await Firebase.initializeApp();
  }

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
                SizedBox(height: MediaQuery.of(context).size.height *0.05),
                Image.asset(
                  'assets/icons/foodpedia.png',
                  height: MediaQuery.of(context).size.height * 0.25,
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
                          ]
                          ),
                      height: 60,
                      child: TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(Icons.account_box,
                              color: Color(0xffffffff)),
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                        if (value == null|| value.isEmpty) {
                          return 'Full Name is required';
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
                        controller: _phoneController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(Icons.add_ic_call,
                              color: Color(0xffffffff)),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                          validator: (value) {
                        if (value == null|| value.isEmpty) {
                          return 'Phone Number is required';
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
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          prefixIcon: Icon(Icons.email,
                              color: Color(0xffffffff)),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                        if (value == null|| value.isEmpty) {
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
                          prefixIcon: Icon(Icons.lock,
                              color: Color(0xffffffff)),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                         validator: (value) {
                          if (value == null|| value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ElevatedButton(
                    onPressed: () async {
                      if (_signupFormKey.currentState!.validate()) {
                        try {
                          await Firebase.initializeApp();
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          User updateUser =
                              FirebaseAuth.instance.currentUser!;
                          updateUser.updateProfile(
                            displayName: _nameController.text,
                          );
                          userSetup(
                              _emailController.text,
                              _nameController.text,
                              _phoneController.text,
                              );
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                          } catch (e) {
                            print(e.toString());
                          }
                      }
                    },
                    child: const Text('Sign Up'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                  fontSize: 17
                )
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Log in!',
                  style: TextStyle(
                  fontSize: 17
                )
                  ),
              )
            ]
          )
        ],
      )),
    );
  }
}