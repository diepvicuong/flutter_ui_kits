import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/plant_widget.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class GreenPlantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
    );
  }
}
