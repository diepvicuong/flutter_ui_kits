import 'package:flutter/material.dart';
import 'package:petcare/features/dashboard_petcare/data/models/pet_type.dart';
import 'package:petcare/res/export.dart';

class PetTypeWidget extends StatelessWidget {
  final PetType type;
  final bool isActive;
  final VoidCallback? onTap;

  const PetTypeWidget(
      {Key? key, required this.type, this.isActive = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color:
                  isActive ? AppColor.kprimaryColor : AppColor.kSecondaryColor,
              borderRadius: BorderRadius.circular(AppSize.commonBorderRadius)),
          child: Image.asset(
            type.image,
            color: isActive ? AppColor.kSecondaryColor : Color(0xffA9A9A9),
            fit: BoxFit.fill,
          ),
        ),
        onTap: onTap,
      ),
      SizedBox(height: 10),
      Expanded(child: Text(type.name))
    ]);
  }
}
