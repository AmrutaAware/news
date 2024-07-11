import 'package:flutter/material.dart';
import 'package:telphanews/modules/AboutUs/presentation/pages/aboutscreen.dart';
import 'package:telphanews/modules/NewsScreen/presentation/pages/SportNewsScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        isDarkMode: isDarkMode,
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
     // home: AboutPageView(),
     
    );
  }
}