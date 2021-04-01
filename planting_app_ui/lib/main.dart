import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/custom_paint.dart';
import 'package:dribbble_plant_app/widgets/drawer_item.dart';
import 'package:dribbble_plant_app/widgets/left_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      title: "Green Plants",
    ),
    DrawerItem(
      title: "Indoor Plants",
    ),
    DrawerItem(
      title: "Shape Close",
    ),
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
                width: 100,
                onTap: (value) {
                  setState(() {
                    print("Current index: $value");
                    _currentIndex = value;
                  });
                },
                topIcon: Icon(Icons.ac_unit),
                onTapTopIcon: () {
                  print("onTapTopIcon");
                },
                bottomIcon: Icon(Icons.access_alarm),
                onTapBottomIcon: () {
                  print("onTapBottomIcon");
                },
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
