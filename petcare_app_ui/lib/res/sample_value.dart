import 'package:flutter/material.dart';
import 'package:petcare/features/dashboard_petcare/data/models/category.dart';
import 'package:petcare/features/dashboard_petcare/data/models/host.dart';
import 'package:petcare/features/dashboard_petcare/data/models/pet_item.dart';
import 'package:petcare/features/dashboard_petcare/data/models/pet_type.dart';
import 'package:petcare/res/export.dart';

final List<PetType> listType = [
  PetType('Squirrel', AppAssets.iconSquirrel),
  PetType('Dog', AppAssets.iconDog),
  PetType('Cat', AppAssets.iconCat),
  PetType('Fish', AppAssets.iconFish),
  PetType('Turtle', AppAssets.iconTurtle),
];

final List<Icon> listBottomNavIcon = [
  Icon(Icons.home_outlined),
  Icon(Icons.favorite_outline),
  Icon(Icons.place_outlined),
  Icon(Icons.person_outline),
];

final List<String> listCategories = [
  "Toilet trained",
  "Spay",
  "Good with cats",
  "Likes to walk",
  "Good with kids",
  "It not bite"
];

final List<PetItem> listPet = [
  PetItem(
      name: 'Which',
      type: "Russian Blue Cat",
      age: 6,
      gender: true,
      image: AppAssets.imgCat1,
      host: Host(
          name: 'Le Quang Minh',
          email: 'minhlq7@gmail.com',
          birthDate: '01.02.1993',
          price: 45),
      category: Category(toiletTrained: true)),
  PetItem(
      name: 'Many',
      type: "Orion Kitty",
      age: 3,
      gender: false,
      image: AppAssets.imgCat2,
      host: Host(
          name: 'Nguyễn Duy Phương',
          email: 'phuongnd28@gmail.com',
          birthDate: '04.05.2003',
          price: 102),
      category: Category(spay: true, likeToWalk: true)),
  PetItem(
      name: 'Honey',
      type: "Scottish-fold Cat",
      age: 7,
      gender: false,
      image: AppAssets.imgCat4,
      host: Host(
          name: 'Nguyễn Chánh Đạt',
          email: 'datnc@gmail.com',
          birthDate: '10.02.1999',
          price: 450),
      category: Category(
          toiletTrained: true, goodWithCats: true, goodWithKids: true)),
  PetItem(
      name: 'Major',
      type: "Tuxedo Cat",
      age: 5,
      gender: true,
      image: AppAssets.imgCat3,
      host: Host(
          name: 'Linh Thành',
          email: 'linhThanh123@gmail.com',
          birthDate: '14.02.1990',
          price: 12),
      category: Category(spay: true, itNotBite: true, goodWithCats: true)),
];
