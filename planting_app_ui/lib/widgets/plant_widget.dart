import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:flutter/material.dart';

class PlantWidget extends StatelessWidget {
  final PlantItem plant;
  final VoidCallback? onTap;

  const PlantWidget({Key? key, required this.plant, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              plant.image,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(height: 20),
          Text(
            plant.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            plant.description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                '\$${plant.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              RawMaterialButton(
                onPressed: () {},
                elevation: 10.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 15.0,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              )
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
