import 'package:petcare/features/dashboard_petcare/data/models/category.dart';
import 'package:petcare/features/dashboard_petcare/data/models/host.dart';

class PetItem {
  final String name;
  final String type;
  final int age;
  final bool gender; //Boy = true, Girl = false
  final String image;
  final Host host;
  final Category category;

  PetItem(
      {required this.name,
      required this.type,
      required this.age,
      required this.gender,
      required this.image,
      required this.host,
      required this.category});
}
