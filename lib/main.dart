import 'package:chatapp/screens/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WhatApp Clone',
        theme: ThemeData(
            fontFamily: "Poppins",
            // primarySwatch: Colors.teal,
            // primaryColor: const Color(0xff075e54),
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xff075e54),
                secondary: const Color(0xff128c7e))),
        home: const HomeScreen());
  }
}
