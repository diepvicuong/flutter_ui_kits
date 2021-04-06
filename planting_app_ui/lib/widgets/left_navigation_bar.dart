import 'package:dribbble_plant_app/models/drawer_item.dart';
import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/custom_paint.dart';
import 'package:flutter/material.dart';
import 'marquee.dart';

typedef _LetIndexPage = bool Function(int value);

class LeftNavigationBar extends StatefulWidget {
  final List<DrawerItem> items;
  // final int index;
  final Color color;
  // final _LetIndexPage letIndexPage;
  final ValueChanged<int> onTap;
  // final Curve animationCurve;
  // final Duration animationDuration;
  final double width;
  final int currentIndex;
  final Icon? topIcon;
  final VoidCallback? onTapTopIcon;
  final Icon? bottomIcon;
  final VoidCallback? onTapBottomIcon;

  LeftNavigationBar(
      {Key? key,
      required this.items,
      // this.index = 0,
      this.color = Colors.white,
      // _LetIndexPage? letIndexPage,
      required this.onTap,
      // this.animationCurve = Curves.easeOut,
      // this.animationDuration = const Duration(milliseconds: 100),
      this.width = 100,
      this.currentIndex = 0,
      this.topIcon,
      this.bottomIcon,
      this.onTapTopIcon,
      this.onTapBottomIcon})
      : assert(width >= 50),
        assert(items.length >= 1 && items.length <= 4),
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
    // _pos = widget.index / _length;
    _pos = 0;

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
    // if (oldWidget.index != widget.index) {
    //   final newPosition = widget.index / _length;
    //   _startingPos = _pos;
    //   _endingIndex = widget.index;
    //   _animationController.animateTo(newPosition,
    //       duration: widget.animationDuration, curve: widget.animationCurve);
    // }
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
          // SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: widget.topIcon != null
                ? IconButton(
                    icon: widget.topIcon!,
                    onPressed: widget.onTapTopIcon,
                  )
                : Container(color: Colors.orange[100]),
          ),
          Column(
            children: widget.items.map((item) {
              var color = Constants.kPrimaryColor;
              int index = widget.items.indexOf(item);
              String title = item.title;
              double height = item.height;
              return GestureDetector(
                onTap: () {
                  _changeIndex(index);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    color: widget.currentIndex == index
                        ? Colors.white
                        : Constants.kPrimaryColor,
                  ),
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
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: MarqueeWidget(
                              direction: Axis.horizontal,
                              child: Text(
                                title,
                                // maxLines: 1,
                                style: TextStyle(
                                    color: widget.currentIndex == index
                                        ? Colors.white
                                        : Colors.white38,
                                    fontSize: 16),
                              ),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: widget.bottomIcon != null
                ? IconButton(
                    icon: widget.bottomIcon!,
                    onPressed: widget.onTapBottomIcon,
                  )
                : Container(color: Colors.yellow[100]),
          ),
        ],
      ),
    );
  }
}
