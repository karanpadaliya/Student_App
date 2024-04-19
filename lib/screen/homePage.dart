import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/screen/studentData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        title: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(children: ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CupertinoColors.link,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, "DetailsPage");
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}



