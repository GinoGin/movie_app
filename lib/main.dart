

import 'package:flutter/material.dart';

import 'homescreen.dart';





void main() {
    runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "MovieApp",
        theme: ThemeData(brightness: Brightness.dark),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
    );
  }
}











