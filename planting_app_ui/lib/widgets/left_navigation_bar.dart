import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/custom_paint.dart';
import 'package:dribbble_plant_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

typedef _LetIndexPage = bool Function(int value);

class LeftNavigationBar extends StatefulWidget {
  final List<DrawerItem> items;
  final int index;
  final Color color;
  final _LetIndexPage letIndexPage;
  final ValueChanged<int> onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  final double width;
  final int currentIndex;

  LeftNavigationBar(
      {Key? key,
      required this.items,
      this.index = 0,
      this.color = Colors.white,
      _LetIndexPage? letIndexPage,
      required this.onTap,
      this.animationCurve = Curves.easeOut,
      this.animationDuration = const Duration(milliseconds: 100),
      this.width = 100,
      this.currentIndex = 0})
      : letIndexPage = letIndexPage ?? ((_) => true),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        super(key: key);

  @override
  _LeftNavigationBarState createState() => _LeftNavigationBarState();
}

class _LeftNavigationBarState extends State<LeftNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  late AnimationController _animationController;
  late int _length;
  late List<DrawerItem> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    _length = _items.length;
    _pos = widget.index / _length;
    _startingPos = _pos;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (_startingPos + endingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          // _icon = _items[_endingIndex];
        }
        // _buttonHide =
        //     (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(LeftNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeIndex(int index) {
    if (widget.onTap != null) {
      widget.onTap(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      color: Constants.kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Container(color: Colors.orange[100]),
            height: 50,
          ),
          Column(
            children: widget.items.map((item) {
              int index = widget.items.indexOf(item);
              String title = item.title;
              double height = item.height;
              return GestureDetector(
                onTap: () {
                  _changeIndex(index);
                },
                child: Container(
                  color: widget.currentIndex == index
                      ? Colors.white
                      : Constants.kPrimaryColor,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                          child: CustomPaint(
                        painter: DrawerCustomPainter(
                            0,
                            1,
                            Constants.kPrimaryColor,
                            Directionality.of(context),
                            widget.width,
                            false),
                        child: Container(
                          height: height,
                          // width: size.width,
                        ),
                      )),
                      Positioned(
                        child: Center(
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Text(
                              title,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            child: Container(color: Colors.yellow[100]),
            height: 50,
          ),
        ],
      ),
    );
  }
}
