// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zomato_clone/Screen/nutrition_screen.dart';
import 'package:zomato_clone/Screen/pro_screen.dart';

import 'donate_screen.dart';
import 'goout_screen.dart';
import 'order_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List screens = [
    OrderScreen(),
    GoOutScreen(),
    ProScreen(),
    NutritionScreen(),
    DonateScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.border_outer_outlined,
                  color: Colors.black,
                ),
                label: "Order"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pedal_bike_outlined,
                  color: Colors.black,
                ),
                label: "Go Out"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on,
                  color: Colors.black,
                ),
                label: "Pro"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.healing,
                  color: Colors.black,
                ),
                label: "Nutrition"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.done,
                  color: Colors.black,
                ),
                label: "Donate")
          ]),
    );
  }
}
