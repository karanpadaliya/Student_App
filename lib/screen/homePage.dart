import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/screen/studentData.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<StudentData> studentList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CupertinoColors.link,
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          StudentData student = studentList[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(File(student.xFile??"")),
              ),
              title: Text('Name: ${student.name}'),
              subtitle: Text('GR-ID: ${student.grid} | Std: ${student.std}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, 'DetailsPage');
          if (result != null && result is StudentData) {
            setState(() {
              studentList.add(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: CupertinoColors.link,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }
}