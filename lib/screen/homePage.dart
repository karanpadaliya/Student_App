import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/screen/allStudentDataPage.dart';
import 'package:student_app/screen/globalData.dart';
import 'package:student_app/screen/studentData.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CupertinoColors.link,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          StudentData student = studentList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => allStudentDataPage(student: student),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: InkWell(
                  onTap: () => _showImagePickerDialog(index),
                  child: CircleAvatar(
                    backgroundImage: student.xFile != null
                        ? FileImage(File(student.xFile!))
                        : null,
                  ),
                ),
                title: Text('Name: ${student.name}'),
                subtitle: Text('GR-ID: ${student.grid} | Std: ${student.std}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showEditDialog(context, index);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteStudent(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
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

  void _showImagePickerDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () => _pickImageFromGallery(index),
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () => _captureImage(index),
              ),
            ],
          ),
        );
      },
    );
  }

  void _pickImageFromGallery(int index) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        studentList[index].xFile = file.path;
      });
    }
    Navigator.pop(context);
  }

  void _captureImage(int index) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        studentList[index].xFile = file.path;
      });
    }
    Navigator.pop(context);
  }

  void _showEditDialog(BuildContext context, int index) async {
    TextEditingController studentNameController =
        TextEditingController(text: studentList[index].name);
    TextEditingController studentGridController =
        TextEditingController(text: studentList[index].grid);
    TextEditingController studentStdController =
        TextEditingController(text: studentList[index].std);

    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Edit Student Profile"),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: studentNameController,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: studentGridController,
                            decoration: InputDecoration(labelText: 'GR-ID'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: studentStdController,
                            decoration: InputDecoration(labelText: 'Std'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: studentList[index].xFile != null
                                ? FileImage(File(studentList[index].xFile!))
                                : null,
                            child: IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: () async {
                                XFile? file = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (file != null) {
                                  setState(() {
                                    studentList[index].xFile = file.path;
                                  });
                                }
                              },
                            ),
                          ),
                          Text("Tap to add photo"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.link,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      studentList[index].name = studentNameController.text;
                      studentList[index].grid = studentGridController.text;
                      studentList[index].std = studentStdController.text;
                    });
                    Navigator.of(context).pop(studentList[index]);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.link,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    // If the result is not null, it means the user saved the changes
    if (result != null && result is StudentData) {
      setState(() {
        // Update the corresponding StudentData object in the list
        studentList[index] = result;
      });
    }
  }

  void _deleteStudent(int index) {
    setState(() {
      studentList.removeAt(index);
    });
  }
}
