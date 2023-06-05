import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:law/Registration.dart';
import 'package:law/chat%20page.dart';
import 'package:law/newchat.dart';
import 'HomePage.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController mailController = TextEditingController();
  TextEditingController password = TextEditingController();
  final auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  register(String email, String password) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Home()));
      log("jhvjvhjvhjv");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('images/splash.png')),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // IntlPhoneField(
              //   decoration: InputDecoration(
              //     labelText: 'Phone Number',
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(),
              //     ),
              //   ),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              // ),
              TextField(
                controller: mailController,
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(22)),
                child: ElevatedButton(
                  onPressed: () async {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => Otp_Field()));
                    try {
                      await register(mailController.text, password.text);
                    } catch (e) {}
                    signIn(mailController.text, password.text);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue[900]),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              //Text('New User? Create Account')
            ],
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => chatpage(
            email: "test@gmail.com",
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
