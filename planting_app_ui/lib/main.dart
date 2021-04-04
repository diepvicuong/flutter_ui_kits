import 'package:dribbble_plant_app/pages/detail_screen.dart';
import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/left_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'models/drawer_item.dart';
import 'models/plant_item.dart';
import 'pages/home_screen.dart';

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
          child: Stack(
            children: [
              // NavigationRail(destinations: destinations, selectedIndex: selectedIndex)
              Container(
                color: Colors.white,
                child: LeftNavigationBar(
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
              ),
              HomeScreen(
                index: _currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
