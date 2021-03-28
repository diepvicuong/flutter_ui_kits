import 'package:flutter/material.dart';

typedef _LetIndexPage = bool Function(int value);

class LeftNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final Color color;
  final _LetIndexPage letIndexPage;
  final ValueChanged<int>? onTap;
  final Curve animationCurve;
  final Duration animationDuration;

  LeftNavigationBar(
      {Key? key,
      required this.items,
      this.index = 0,
      this.color = Colors.white,
      _LetIndexPage? letIndexPage,
      this.onTap,
      this.animationCurve = Curves.easeOut,
      this.animationDuration = const Duration(milliseconds: 100)})
      : letIndexPage = letIndexPage ?? ((_) => true),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        super(key: key);

  @override
  _LeftNavigationBarState createState() => _LeftNavigationBarState();
}

class _LeftNavigationBarState extends State<LeftNavigationBar> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
