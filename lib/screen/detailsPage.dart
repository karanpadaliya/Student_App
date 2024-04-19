import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/screen/studentData.dart';
import 'package:student_app/screen/studentModel.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {

    TextEditingController studentNameController = TextEditingController();
    TextEditingController studentGridController = TextEditingController();
    TextEditingController studenStdController = TextEditingController();

    // void _addStudentData() {
    //   setState(() {
    //     allStudentData.add({
    //       'name': studentNameController.text,
    //       'grid': studentGridController.text,
    //       'std': studenStdController.text,
    //       // 'xFile': xFileController.text,
    //     });
    //     // Clear text fields after adding data
    //     studentNameController.clear();
    //     studentGridController.clear();
    //     studenStdController.clear();
    //     // xFileController.clear();
    //   });
    // }

    // var studentModel = StudentModel.fromJson(studentData as Map<String, dynamic>);

    return Scaffold(
      // backgroundColor: CupertinoColors.darkBackgroundGray,
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
          padding:
              const EdgeInsets.only(top: 20, left: 15, right: 10, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 450,
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
                  padding: const EdgeInsets.only(top: 8, left: 8,right: 8),
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
                            padding: const EdgeInsets.only(top: 20,left: 130,),
                            child: InkWell(
                              onTap: () {
                                _addLogo(context, () {
                                  setState(() {});
                                });
                              },
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
                                  backgroundImage: FileImage(
                                    File(studentData.xFile ?? ""),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 85,left: 200),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Student Name
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 5),
                                child: Text(
                                  "Student Name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 400,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: studentNameController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                          
                              //Student grid
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 5),
                                child: Text(
                                  "GR.Id",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 400,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: studentGridController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.recent_actors),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                          
                              //student_standard
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 5),
                                child: Text(
                                  "Standard",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                height: 42,
                                width: 400,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: studenStdController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.stacked_bar_chart),
                                    border: InputBorder.none,
                                  ),
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
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.link,
                  foregroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
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
                  String studentName = studentNameController.text;
                  studentData.name = studentName;
                  String studentGrid = studentGridController.text;
                  studentData.grid = studentGrid;
                  String studentStd = studenStdController.text;
                  studentData.std = studentStd;
                  Navigator.pushReplacementNamed(context, "HomePage");
                  allStudentData.add(studentNameController);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addLogo(BuildContext context, VoidCallback callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20, left: 0),
            child: Text(
              'Add Image',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  XFile? file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  studentData.xFile = file?.path ?? "No Find Path";
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () async {
                  XFile? file =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  studentData.xFile = file?.path ?? "";
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}