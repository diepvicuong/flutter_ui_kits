import 'package:flutter/material.dart';
import 'package:petcare/res/export.dart';
import 'package:petcare/core/widgets/custom_bottom_navigation_bar.dart';

import 'home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          items: listBottomNavIcon,
          onTap: (index) {
            print('Index: $index');
            setState(() {
              activeIndex = index;
            });
          },
        ),
        body: IndexedStack(index: activeIndex, children: [
          HomePage(),
          Center(
            child: Text('Page ${activeIndex}'),
          ),
          Center(
            child: Text('Page ${activeIndex}'),
          ),
          Center(
            child: Text('Page ${activeIndex}'),
          )
        ]));
  }
}
