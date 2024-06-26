import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/screen/studentData.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


  final _formKey = GlobalKey<FormState>();

  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentGridController = TextEditingController();
  TextEditingController studentStdController = TextEditingController();

  String? xFile;

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      if (xFile != null) {
        StudentData studentData = StudentData(
          name: studentNameController.text,
          grid: studentGridController.text,
          std: studentStdController.text,
          xFile: xFile,
        );

        Navigator.pop(context, studentData);
      } else {
        // Handle case where no image is selected
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Select an image."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Form(
            key: _formKey,
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
                                    backgroundImage:
                                        FileImage(File(xFile ?? "")),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 85, left: 200),
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
                                  // initialValue: studentData.name,
                                  controller: studentNameController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    label: Text('Student Name'),
                                    prefixIcon: Icon(Icons.person),
                                    // border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter student name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  // initialValue: studentData.name,
                                  controller: studentGridController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    label: Text('GR Id'),
                                    prefixIcon: Icon(Icons.recent_actors),
                                    // border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter GR Id';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  // initialValue: studentData.name,
                                  controller: studentStdController,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    label: Text('Standard'),
                                    prefixIcon: Icon(Icons.stacked_bar_chart),
                                    // border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Standard';
                                    }
                                    return null;
                                  },
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
                  onPressed: _saveData,
                ),
              ],
            ),
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
                  if (file != null) {
                    setState(() {
                      xFile = file.path;
                    });
                  }
                  Navigator.pop(context);
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
                  if (file != null) {
                    setState(() {
                      xFile = file.path;
                    });
                  }
                  Navigator.pop(context);
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
