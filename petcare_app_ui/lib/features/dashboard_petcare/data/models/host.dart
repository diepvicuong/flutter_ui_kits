import 'package:petcare/res/assets.dart';

class Host {
  final String name;
  final String email;
  final String birthDate;
  final int price;
  final String imgAvatar;

  Host(
      {required this.name,
      required this.email,
      required this.birthDate,
      required this.price,
      this.imgAvatar = AppAssets.imgUser1});
}
