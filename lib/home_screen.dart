import 'package:emaritas_auction/items_screen.dart';
import 'package:emaritas_auction/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'core/common/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int endTime = DateTime.now().millisecondsSinceEpoch + 100000 * 30;

  List<Cart> cart = [
    Cart(
        image: "assets/images/search-property.png",
        name: "Property",
        count: 40,
        time: DateTime.now().millisecondsSinceEpoch + 100000 * 300),
    Cart(
        image: "assets/images/search-vehicles.png",
        name: "Vehicles",
        count: 10,
        time: DateTime.now().millisecondsSinceEpoch + 100000 * 30),
    Cart(
        image: "assets/images/miscellaneous-box.png",
        name: "Miscellaneous",
        count: 100,
        time: DateTime.now().millisecondsSinceEpoch + 10000 * 30),
  ];

  List<ItemModel> items = [
    ItemModel(
      image: "assets/images/property1.jpg",
      name: "Burj Al Arab",
      lot: "Al Majaz 3 - Sharajah",
      auctionsNumber: 2,
      time: "1d:8h",
      price: "AED 498,750",
    ),
    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),

    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),
    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),
    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),
    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),
    ItemModel(
      image: "assets/images/property2.png",
      name: "Silver tower",
      lot: "business Bay - Dubai",
      auctionsNumber: 10,
      time: "10d:5h",
      price: "AED 632,916",
    ),

    ItemModel(
      image: "assets/images/property3.jpg",
      name: "Building",
      lot: "Al Sajaa industrial - Sharjah",
      auctionsNumber: 0,
      time: "21h:25m",
      price: "AED 4,816,500",
    ),
  ];

  responsiveScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portraitScreen(width, height);
    } else if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landscapeScreen(width, height);
    }
  }

  Widget portraitScreen(double width, double height) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new RadialGradient(
          radius: 1.8,
          colors: [
            Color.fromARGB(255, 255,255,255),
            Color.fromARGB(255, 255,200,203),
          ],

        ),),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return cartBuild(cart[index].image, cart[index].count, cart[index].name,
              cart[index].time);
        },
        itemCount: cart.length,
      ),
    );
  }

  Widget cartBuild(String image, int count, String name, int time) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(height * 0.05),
      child: Center(
        child: InkWell(
          onTap: () {
            print(name.toString());
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemsScreen(
                  item: items,
                ),
              ),
            );
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(
                      image,
                      height: height * 0.05,
                      width: width * 0.2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          count.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(name),
                SizedBox(
                  height: 5,
                ),
                CountdownTimer(
                  endTime: time,
                  textStyle: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget landscapeScreen(double height, double width) {
    return Container();
  }

  buildDrawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: buildDrawer(),
        backgroundColor: AppColors.white,
        body: responsiveScreen(context),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Emirates Auction'),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class Cart {
  final String image;
  final String name;
  final int count;
  final int time;

  Cart(
      {required this.image,
      required this.name,
      required this.count,
      required this.time});
}
