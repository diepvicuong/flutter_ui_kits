import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:dribbble_plant_app/widgets/left_navigation_bar.dart';
import 'package:dribbble_plant_app/widgets/plant_widget.dart';
import 'package:flutter/material.dart';

import 'models/drawer_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  List<DrawerItem> _drawerItems = <DrawerItem>[
    DrawerItem(
      title: "Green Plant",
    ),
    DrawerItem(
      title: "Indoor Plants",
    ),
    DrawerItem(
      title: "Shape Close",
    ),
    // DrawerItem(
    //   title: "Test",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              // NavigationRail(destinations: destinations, selectedIndex: selectedIndex)
              LeftNavigationBar(
                currentIndex: _currentIndex,
                items: _drawerItems,
                width: 70,
                onTap: (value) {
                  setState(() {
                    print("Current index: $value");
                    _currentIndex = value;
                  });
                },
                topIcon: Icon(
                  Icons.workspaces_filled,
                  color: Colors.white,
                ),
                onTapTopIcon: () {
                  print("onTapTopIcon");
                },
                bottomIcon: Icon(Icons.home_outlined, color: Colors.white),
                onTapBottomIcon: () {
                  print("onTapBottomIcon");
                },
              ),
              Expanded(
                  child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {}),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: RichText(
                          text: TextSpan(
                            text: 'Green ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: '\n'),
                              TextSpan(
                                  text: 'Plant',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      PlantWidget(
                          plant: PlantItem(
                              name: "Turf pot plant",
                              description:
                                  "Big leaf plant in a turf pot for your home or office decor",
                              price: 45.00,
                              image: 'assets/images/klipartz.png')),
                      PlantWidget(
                          plant: PlantItem(
                              name: "Scandinavian plant",
                              description:
                                  "Low maintenance flower in a white ceramic pot",
                              price: 45.00,
                              image: 'assets/images/scandinavian.png')),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
