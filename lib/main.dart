import 'package:flutter/material.dart';
import 'package:zomato_clone/Authenticate/splash_screen.dart';
import 'package:zomato_clone/Screen/home_screen.dart';
import 'package:zomato_clone/Screen/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zomato',
      home: MenuScreen(),
    );
  }
}
