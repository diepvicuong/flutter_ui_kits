import 'package:flutter/material.dart';
import 'package:petcare/features/dashboard_petcare/presentation/pages/main_screen.dart';
import 'package:petcare/res/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.kBackgroundColor,
        scaffoldBackgroundColor: AppColor.kBackgroundColor,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
