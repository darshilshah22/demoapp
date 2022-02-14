import 'package:flutter/material.dart';
import 'package:my_app/screens/find_friend.dart';
import 'package:my_app/screens/home_details.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/location1.dart';
import 'package:my_app/screens/set_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SetLocation(),
    );
  }
}