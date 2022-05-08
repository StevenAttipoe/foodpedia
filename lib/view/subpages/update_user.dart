import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodpedia/view/nav/profile.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile(this.name, this.bio, {Key? key}) : super(key: key);
  final String name;
  final String bio;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final String? uid = FirebaseAuth.instance.currentUser?.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.name,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.bio,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                updateDialog(context);
                try {
                  DocumentReference post = await FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('info')
                      .get()
                      .then((QuerySnapshot snapshot) {
                          return snapshot.docs[0].reference;
                        });

                  WriteBatch batch = FirebaseFirestore.instance.batch();
                  batch.update(post, {
                    'fullName': _nameController.text,
                    'phone': _phoneController.text,
                  });
                  batch.commit();
                  
                } catch (e) {
                  print(e);
                }
                Navigator.pop(context);
              },
              child: const Text('Update Profile'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateDialog(context) async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Successful'),
          content: const SingleChildScrollView(
            child: Text('You have successfully updated your information'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Done',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: ()  {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage() ));
              },
            ),
          ],
        );
      },
    );
  }
}
