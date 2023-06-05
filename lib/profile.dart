import 'package:flutter/material.dart';
import 'package:law/signup.dart';

import 'book appointment.dart';
import 'chat page.dart';


class Profile {
  final String name;
  final String occupation;
  final String imageUrl;
  final String about;
  final String studies;

  Profile(this.name, this.occupation, this.imageUrl,this.about, this.studies);
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profile.imageUrl),
            radius: 40.0,
          ),
          SizedBox(height: 8.0),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            profile.occupation,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Profile profile;

  ProfilePage({required this.profile});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: height*.98,
            width: width,
            child: Stack(
              //alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: height*.45,
                    width: width,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: Colors.white,
                   ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          profile.imageUrl,
                          fit: BoxFit.contain,
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_back_ios, color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height*.63,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height*.1,
                            width:width ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffEEEEEE),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      profile.name,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          profile.occupation,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo()));
                                        },
                                          child: Icon(Icons.message)
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12,top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  height: height*.02,
                                ),
                                Text(
                                  profile.about,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  height: height*.02,
                                ),
                                Text(
                                  'Studies',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  height: height*.02,
                                ),
                                Text(
                                  profile.studies,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 23,
                  left: width/8,
                  right: width/8,
                  child: SizedBox(
                    height: height*.07,
                    width: width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookingAppointmentScreen()));
                        },
                        child: Text(
                            'Book an Appointment',
                            style: TextStyle(
                              fontSize: 20
                            ),
                        )
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}