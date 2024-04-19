import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/screen/detailsPage.dart';
import 'package:student_app/screen/homePage.dart';


void main() {
  runApp(MainPage());
}


class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: CupertinoColors.link,
        systemNavigationBarColor: CupertinoColors.link,
        systemNavigationBarDividerColor: CupertinoColors.link,
      ),
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "HomePage",
      theme: ThemeData(
        fontFamily: "Rubik",
      ),
      routes: {
        "HomePage": (context) => HomePage(),
        "DetailsPage": (context) => DetailsPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "onUnknownRoute",
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}