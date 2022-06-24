// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zomato_clone/Authenticate/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        (() => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()))));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(226, 56, 70, 1),
          Color.fromRGBO(217, 39, 97, 1)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
            child: Text(
          "Zomato",
          style: TextStyle(
              fontSize: 38.sp,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
