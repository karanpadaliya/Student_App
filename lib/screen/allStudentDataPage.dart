import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/screen/studentData.dart';

class allStudentDataPage extends StatefulWidget {
  final StudentData student;

  allStudentDataPage({Key? key, required this.student}) : super(key: key);

  @override
  _allStudentDataPageState createState() => _allStudentDataPageState();
}

class _allStudentDataPageState extends State<allStudentDataPage> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentGridController = TextEditingController();
  TextEditingController studentStdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with student data
    studentNameController.text = widget.student.name!;
    studentGridController.text = widget.student.grid!;
    studentStdController.text = widget.student.std!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.link,
        foregroundColor: Colors.white,
        title: Text(
          'Detail Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 500,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Info',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 130,
                            ),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xfff4f4f4),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xfff4f4f4),
                                backgroundImage:
                                    FileImage(File(widget.student.xFile!)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 85, left: 200),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_enhance_sharp,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: studentNameController,
                                // initialValue: student.name,
                                decoration: InputDecoration(
                                  label: Text('Student Name'),
                                  prefixIcon: Icon(Icons.person),
                                ),
                              ),
                              TextFormField(
                                controller: studentGridController,
                                // initialValue: student.grid,
                                decoration: InputDecoration(
                                  label: Text('GR Id'),
                                  prefixIcon: Icon(Icons.recent_actors),
                                  // border: InputBorder.none,
                                ),
                              ),
                              TextFormField(
                                controller: studentStdController,
                                // initialValue: student.std,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  label: Text('Standard'),
                                  prefixIcon: Icon(Icons.stacked_bar_chart),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.link,
                  foregroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 5), // Button padding
                ),
                child: Text(
                  ' Save ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ), // Button text
                onPressed: () {
                  // Update student data when Save button is pressed
                  widget.student.name = studentNameController.text;
                  widget.student.grid = studentGridController.text;
                  widget.student.std = studentStdController.text;
                  // Navigate back to previous screen with updated student data
                  Navigator.pop(context, widget.student);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}