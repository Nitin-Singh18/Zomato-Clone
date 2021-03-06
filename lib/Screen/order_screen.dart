// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zomato_clone/Screen/menu.dart';
import 'package:zomato_clone/const.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  final List<String> options = [
    "Pro",
    "Rating: 4.0+",
    "Max Safety",
    "Fastest delivery",
    "Offers",
    "TakeAway",
    "Popular"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          header(size),
          searchBar(size),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: optionAvailable(size),
          ),
          offerCard(size),
          SizedBox(
            height: size.height / 35,
          ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Eat what make you happy",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          SizedBox(
            height: size.height / 35,
          ),
          itemList(size),
          Container(
            width: size.width / 1.1,
            child: Text(
              "877 restaurants around you",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          restaurantsAvailable(size),
        ]),
      )),
    );
  }

  Widget restaurantsAvailable(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      child: ListView.builder(
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            return itemBuilder(size, index, context);
          }),
    );
  }

  Widget itemBuilder(Size size, int index, BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => MenuScreen())),
          ),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: size.height / 2.5,
              width: size.width / 1.1,
              child: Column(children: [
                Container(
                  height: size.height / 4,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(restaurantList[index].imageUrl),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: size.height / 12,
                  width: size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantList[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: size.height / 25,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        alignment: Alignment.center,
                        child: Text(
                          restaurantList[index].rating,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 1.2,
                  child: Text(
                    "${restaurantList[index].locations}   \t\t\t\t\t\t\t\t\t\t\t\t\t\t  ${restaurantList[index].price} for one",
                    style:
                        TextStyle(fontSize: 12.9, fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
          ),
        ));
  }

  Widget itemList(Size size) {
    return Container(
      height: size.height / 3,
      width: size.width,
      child: GridView.builder(
          itemCount: foodItemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Container(
              height: size.height / 3,
              width: size.width,
              child: Column(children: [
                Container(
                  height: size.height / 10,
                  width: size.width / 10,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(foodItemList[index].imageUrl))),
                ),
                Text(
                  foodItemList[index].name,
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ]),
            );
          }),
    );
  }

  Widget offerCard(Size size) {
    return Container(
      height: size.height / 2.7,
      width: size.width / 1.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(226, 56, 70, 1)),
      child: Column(children: [
        Container(
          height: size.height / 6,
          width: size.width / 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                "https://www.pikpng.com/pngl/m/327-3271979_half-a-pizza-transparent-background-clipart.png",
              ),
            ),
          ),
        ),
        Container(
          width: size.width / 1.25,
          child: Text(
            "Welcome",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: size.width / 1.25,
            child: Text(
              "GET 50% OFF \nON FIRST ORDER",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: size.width / 1.25,
          child: Text(
            "Order Now >",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        )
      ]),
    );
  }

  Widget optionAvailable(Size size) {
    return Container(
      height: size.height / 15,
      width: size.width,
      child: ListView.builder(
          itemCount: options.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: size.height / 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey)),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(options[index]),
              ),
            );
          }),
    );
  }

  Widget searchBar(Size size) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.1,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        SizedBox(
          width: size.width / 40,
        ),
        Icon(
          Icons.search,
          color: Colors.red,
        ),
        SizedBox(
          width: size.width / 20,
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Restaurant name,cuisine, or a dish..."),
        ))
      ]),
    );
  }

  Widget header(Size size) {
    return Container(
      height: size.height / 10,
      width: size.width,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.add_location,
            color: Colors.black,
          ),
        ),
        Text(
          "Add Your Location Here",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: size.width / 5,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu))
      ]),
    );
  }
}
