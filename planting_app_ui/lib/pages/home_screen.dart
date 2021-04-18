import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:dribbble_plant_app/pages/detail_screen.dart';
import 'package:dribbble_plant_app/utils/constants.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return widget.index != 0
        ? Container(
            child: Center(
                child: Text(
              'Page: ${widget.index + 1}',
              style: TextStyle(fontSize: 50),
            )),
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(color: Colors.white),
            height: double.infinity,
            margin: EdgeInsets.only(left: isDrawerOpen ? 70 : 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.only(top: 30),
                    leading: isDrawerOpen
                        ? IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                isDrawerOpen = false;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                xOffset = 70;
                                yOffset = 0;
                                isDrawerOpen = true;
                              });
                            }),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                  ),
                  TweenAnimationBuilder(
                    duration: Duration(milliseconds: 1000),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: Padding(
                          padding: EdgeInsets.only(top: value * 20),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40),
                      child: RichText(
                        text: TextSpan(
                          text: 'Green ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
