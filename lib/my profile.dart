import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final TextEditingController name = TextEditingController();
  final TextEditingController phnNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  File? image ;
  final _picker = ImagePicker();

  Future getImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery , imageQuality: 80);
    print("1-----------$pickedFile");
    if(pickedFile!= null ){
      image = File(pickedFile.path);
      print("2-------------$image");
      setState(() {
      });
    }else {
      print('no image selected');
    }
  }


  @override
  Widget build(BuildContext context) {
    name.text = "Ryle Kincaid";
    phnNumber.text = "8845120965";
    email.text = "rylethedoctor@gmail.com";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'FrankRuhl',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
          },
          child: ListView(children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    child: Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)),
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://www.dlf.pt/dfpng/middlepng/247-2479526_round-profile-picture-png-transparent-png.png'))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    child: Container(
                      child: image!= null?
                      ClipOval(
                        child: Image.file(image!,
                          width: 170,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      ):
                      const SizedBox(),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.8),
                            shape: BoxShape.circle
                        ),
                        child: GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 200,
                              child: TextField(
                                controller: name,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.phone_android,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 200,
                            child: TextField(
                              controller: phnNumber,
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 200,
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:  Colors.blue[900]),
                    child: Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Playfair',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Container(
                  //     height: 80,
                  //     decoration: BoxDecoration(
                  //       color: Color.fromRGBO(196, 135, 198, .3).withOpacity(0.2),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 230,
                  //               top: 5),
                  //           child: Text('Gender',
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.grey,
                  //               fontSize: 15,
                  //             ),),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(bottom: 30),
                  //         child: InkWell(
                  //           onTap: () async {
                  //             final action = await AlertDialogs.yesCancelDialog(context, 'Logout', 'Are you sure?');
                  //             if (action == DialogsAction.cancel) {
                  //               setState(() => tappedYes = true);
                  //             } else {
                  //               setState(() {
                  //                 Navigator.push(context, MaterialPageRoute(builder: (context){
                  //                   return pinCodeVerificationScreen();
                  //                 }));
                  //               });
                  //             }
                  //           },
                  //           child: Container(
                  //             width: 140,
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //               color: Color(0xff854bb0),
                  //               borderRadius: BorderRadius.circular(25),
                  //             ),
                  //             child: Center(
                  //               child: Text(
                  //                 'Log Out',
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.white,
                  //                   fontSize: 20,
                  //                   fontFamily: 'Playfair',
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Row(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(bottom: 30),
                  //             child: InkWell(
                  //               onTap: (){
                  //                 uploadImage(image!);
                  //               },
                  //               child: Container(
                  //                 width: 140,
                  //                 height: 50,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(25),
                  //                     color:  Color(0xff854bb0)),
                  //                 child: Center(
                  //                   child: Text(
                  //                     'Save',
                  //                     style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                       fontFamily: 'Playfair',
                  //                       fontSize: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ]),
          ]),
        ),
      ),
    );
  }
}
