import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:dribbble_plant_app/utils/constants.dart';
import 'package:dribbble_plant_app/widgets/custom_container.dart';
import 'package:dribbble_plant_app/widgets/plant_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final PlantItem plant;

  const DetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        color: Constants.kPrimaryColor,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: CustomPaint(
                painter: CustomContainerPainter(),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PlantWidget(plant: plant),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FeatureWidget(
                        image: 'assets/images/height.jpg',
                        title: 'Height',
                        value: '40cm - 50cm'),
                    FeatureWidget(
                        image: 'assets/images/thermometer.png',
                        title: 'Temperature',
                        value: '18°C to 25°C'),
                    FeatureWidget(
                        image: 'assets/images/plant-pot.png',
                        title: 'Pot',
                        value: 'Self Waltering Pot'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final String image;
  final String title;
  final String value;

  const FeatureWidget(
      {Key? key, required this.image, required this.title, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
            width: 40,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(value,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
