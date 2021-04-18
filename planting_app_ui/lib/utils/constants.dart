import 'package:dribbble_plant_app/models/plant_item.dart';
import 'package:flutter/material.dart';

class Constants {
  static final kPrimaryColor =
      Color.fromRGBO(99, 132, 47, 1); //Preffered primary color
  static final kHighlightColor =
      Color.fromRGBO(99, 132, 47, 0.7); //Preffered primary color
  static final kHighlightColor2 =
      Color.fromRGBO(99, 132, 47, 0.3); //Preffered primary color
}

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
