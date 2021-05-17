import 'package:flutter/material.dart';
import 'package:petcare/res/export.dart';

typedef TabChange = Function();

class CustomBottomNavBar extends StatefulWidget {
  final List<Icon> items;
  final Color? backgroundColor;
  final Color? itemTintColor;
  final Color? itemBackgroundColor;
  final ValueChanged<int> onTap;
  final double height;
  final int startIndex;

  CustomBottomNavBar(
      {required this.items,
      this.backgroundColor,
      this.itemTintColor,
      this.itemBackgroundColor,
      required this.onTap,
      this.height = 75.0,
      this.startIndex = 0});

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late Color _itemColor;
  late Color _itemBgColor;
  late int _startIndex;

  @override
  void initState() {
    super.initState();
    _itemBgColor = widget.itemBackgroundColor ?? AppColor.kprimaryColor;
    _itemColor = widget.itemTintColor ?? AppColor.kSecondaryColor;
    _startIndex = widget.startIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.backgroundColor ?? AppColor.kSecondaryColor,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((Icon item) {
            final currentIndex = widget.items.indexOf(item);
            return GestureDetector(
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _startIndex == currentIndex ? _itemBgColor : null,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconTheme(
                      data: IconThemeData(
                          color: _startIndex == currentIndex
                              ? _itemColor
                              : Colors.grey[400]),
                      child: item)),
              onTap: () {
                setState(() {
                  _itemColor = AppColor.kSecondaryColor;
                  _itemBgColor = AppColor.kprimaryColor;
                  _startIndex = currentIndex;
                  widget.onTap(currentIndex);
                });
              },
            );
          }).toList()),
    );
  }
}
