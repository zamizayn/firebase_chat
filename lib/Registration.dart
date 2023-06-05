import 'package:flutter/material.dart';
import 'package:law/Homepage.dart';
import 'package:law/signup.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mainHome.dart';

class Otp_Field extends StatefulWidget {
  @override
  State<Otp_Field> createState() => _Otp_FieldState();
}

class _Otp_FieldState extends State<Otp_Field> {
  bool checked = true;
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),

        centerTitle: true,
        title: Text("Verify your OTP",style: TextStyle(color: Colors.black ),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: TextStyle(
                    fontSize: 15
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            TextButton(onPressed: (){}, child: Text("Resent",style: TextStyle(color: Colors.blue[900]),))
          ],
        ),
      ),
    );
  }
}