import 'package:flutter/material.dart';
import 'package:law/explore.dart';
import 'package:law/my%20profile.dart';
import 'package:law/profile.dart';

import 'chat page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController=TextEditingController();
  final List<String> _data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    //searchController.addListener(performSearch);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  // await Future_void.delayed(const Duration(milliseconds: 1000));
  //
  // setState(() {
  // _filteredData = _data
  //     .where((element) => element
  //     .toLowerCase()
  //     .contains(_searchController.text.toLowerCase()))
  //     .toList();
  // _isLoading = false;
  // });

  final List<Profile> profiles = [
    Profile('John Doe', 'Criminal Lawyer', 'images/lawyer1.jpg','Whether you are accused for a crime against a person (like assault or murder), a crime against property (like shoplifting or theft), or any other criminal offense, a criminal lawyer can help. ','Parallel to your studies or after, you should try to gain work experience under an established criminal lawyer or in a legal firm. Field experience and specialisation are very important for developing a successful career in criminal law'),
    Profile('Jane Smith', 'family lawyer', 'images/lawyer2.png','RS Family Attorney divorce Lawyers are one of the best divorce & family lawyers in Kerala based out of Kochi, having offices in Kochi and Trivandrum, Kerala. Advocate Rejitha Sunil is the lead lawyer of the firm.','Marriage, Adoption, Divorce, Child Custody, Maintenance, Guardianship, Partition, Parental Responsibility, Litigations, Civil, Criminal, Corporate, Intellectual Property, Accident & Injury Law'),
    Profile('Mark Johnson', 'Criminal Lawyer', 'images/lawyer3.png','RS Family Attorney divorce Lawyers are one of the best divorce & family lawyers in Kerala based out of Kochi, having offices in Kochi and Trivandrum, Kerala. Advocate Rejitha Sunil is the lead lawyer of the firm.','Marriage, Adoption, Divorce, Child Custody, Maintenance, Guardianship, Partition, Parental Responsibility, Litigations, Civil, Criminal, Corporate, Intellectual Property, Accident & Injury Law'),
    Profile('Emily Brown', 'Criminal Lawyer', 'images/lawyer4.png','Whether you are accused for a crime against a person (like assault or murder), a crime against property (like shoplifting or theft), or any other criminal offense, a criminal lawyer can help. ','Parallel to your studies or after, you should try to gain work experience under an established criminal lawyer or in a legal firm. Field experience and specialisation are very important for developing a successful career in criminal law'),
    Profile('John Doe', 'Criminal Lawyer', 'images/lawyer1.jpg','RS Family Attorney divorce Lawyers are one of the best divorce & family lawyers in Kerala based out of Kochi, having offices in Kochi and Trivandrum, Kerala. Advocate Rejitha Sunil is the lead lawyer of the firm.','Marriage, Adoption, Divorce, Child Custody, Maintenance, Guardianship, Partition, Parental Responsibility, Litigations, Civil, Criminal, Corporate, Intellectual Property, Accident & Injury Law'),
    Profile('Jane Smith', 'family lawyer', 'images/lawyer2.png','RS Family Attorney divorce Lawyers are one of the best divorce & family lawyers in Kerala based out of Kochi, having offices in Kochi and Trivandrum, Kerala. Advocate Rejitha Sunil is the lead lawyer of the firm.','Marriage, Adoption, Divorce, Child Custody, Maintenance, Guardianship, Partition, Parental Responsibility, Litigations, Civil, Criminal, Corporate, Intellectual Property, Accident & Injury Law'),
    Profile('Mark Johnson', 'Criminal Lawyer', 'images/lawyer3.png','RS Family Attorney divorce Lawyers are one of the best divorce & family lawyers in Kerala based out of Kochi, having offices in Kochi and Trivandrum, Kerala. Advocate Rejitha Sunil is the lead lawyer of the firm.','Marriage, Adoption, Divorce, Child Custody, Maintenance, Guardianship, Partition, Parental Responsibility, Litigations, Civil, Criminal, Corporate, Intellectual Property, Accident & Injury Law'),
    Profile('Emily Brown', 'Criminal Lawyer', 'images/lawyer4.png','Whether you are accused for a crime against a person (like assault or murder), a crime against property (like shoplifting or theft), or any other criminal offense, a criminal lawyer can help. ','Parallel to your studies or after, you should try to gain work experience under an established criminal lawyer or in a legal firm. Field experience and specialisation are very important for developing a successful career in criminal law'),
    // Add more profiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        ),
      ),

     // drawer: Drawer(),
      backgroundColor: Colors.black,
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: profiles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(profile: profiles[index]),
                ),
              );
            },
            child: ProfileCard(profile: profiles[index]),
          );
        },
      ),
    );
  }
  // class HomePage extends StatefulWidget {
  //  HomePage({Key? key}) : super(key: key);
  //
  // @override
  // State<HomePage> createState() => _HomePageState();
  // }
  //
  // class _MyHomePageState extends State<MyHomePage> {
  // final TextEditingController _searchController = TextEditingController();
  // final List<String> _data = [
  // 'Apple',
  // 'Banana',
  // 'Cherry',
  // 'Date',
  // 'Fig',
  // 'Grape',
  // 'Lemon',
  // 'Mango',
  // 'Orange',
  // 'Papaya',
  // 'Peach',
  // 'Plum',
  // 'Raspberry',
  // 'Strawberry',
  // 'Watermelon',
  // ];
  // List<String> _filteredData = [];
  // bool _isLoading = false;
  //
  // @override
  // void initState() {
  // super.initState();
  // _filteredData = _data;
  // _searchController.addListener(_performSearch);
  // }
  //
  // @override
  // void dispose() {
  // _searchController.dispose();
  // super.dispose();
  // }
  //
  // Future<void> _performSearch() async {
  // setState(() {
  // _isLoading = true;
  // });
  //
  // //Simulates waiting for an API call
  // await Future.delayed(const Duration(milliseconds: 1000));
  //
  // setState(() {
  // _filteredData = _data
  //     .where((element) => element
  //     .toLowerCase()
  //     .contains(_searchController.text.toLowerCase()))
  //     .toList();
  // _isLoading = false;
  // });
  // }
  //
  // @override
  // Widget build(BuildContext context) => Scaffold(
  // appBar: AppBar(
  // flexibleSpace: Container(
  // decoration: BoxDecoration(
  // gradient: LinearGradient(
  // colors: [Colors.deepPurple, Colors.purple.shade300],
  // begin: Alignment.topLeft,
  // end: Alignment.bottomRight,
  // ),
  // ),
  // ),
  // title: TextField(
  // controller: _searchController,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: Colors.white,
  // decoration: const InputDecoration(
  // hintText: 'Search...',
  // hintStyle: TextStyle(color: Colors.white54),
  // border: InputBorder.none,
  // ),
  // ),
  // ),
  // body: _isLoading
  // ? const Center(
  // child: CircularProgressIndicator(color: Colors.white),
  // )
  //     : ListView.builder(
  // itemCount: _filteredData.length,
  // itemBuilder: (context, index) => ListTile(
  // title: Text(
  // _filteredData[index],
  // style: const TextStyle(color: Colors.white),
  // ),
  // ),
  // ),
  // backgroundColor: Colors.deepPurple.shade900,
  // );
  // }
}