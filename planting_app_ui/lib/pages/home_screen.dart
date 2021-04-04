import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:dribbble_plant_app/pages/detail_screen.dart';
import 'package:dribbble_plant_app/widgets/plant_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  const HomeScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  List<PlantItem> listPlant = [
    PlantItem(
        name: "Scandinavian plant",
        description: "Low maintenance flower in a white ceramic pot",
        price: 45.00,
        image: 'assets/images/scandinavian.png'),
    PlantItem(
        name: "Turf pot plant",
        description:
            "Big leaf plant in a turf pot for your home or office decor",
        price: 45.00,
        image: 'assets/images/klipartz.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: widget.index == 0 ? Colors.white : Colors.blue[100]),
      height: double.infinity,
      margin: EdgeInsets.only(left: isDrawerOpen ? 70 : 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              isDrawerOpen
                  ? IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          isDrawerOpen = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = 70;
                          yOffset = 0;
                          isDrawerOpen = true;
                        });
                      }),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ]),
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
                            fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listPlant.length,
              itemBuilder: (context, index) {
                return PlantWidget(
                  plant: listPlant[index],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(plant: listPlant[index]),
                        ));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
