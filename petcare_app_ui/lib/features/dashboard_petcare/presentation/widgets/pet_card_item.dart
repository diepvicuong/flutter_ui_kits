import 'package:flutter/material.dart';
import 'package:petcare/features/dashboard_petcare/data/models/pet_item.dart';
import 'package:petcare/res/export.dart';

class PetCardItem extends StatelessWidget {
  final double height;
  final PetItem pet;
  final VoidCallback? onTap;
  const PetCardItem(
      {Key? key, required this.height, required this.pet, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.commonBorderRadius),
        child: Container(
          height: height,
          color: AppColor.kSecondaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppSize.commonBorderRadius),
                  child: Hero(
                    tag: '${pet.name}_${pet.image}',
                    child: Image.asset(
                      pet.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pet.type, style: AppStyle.petTypeTextStyle),
                    SizedBox(height: 5),
                    Text('Name: ${pet.name}', style: AppStyle.petNameTextStyle),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Image.asset(AppAssets.iconPetFoot),
                          SizedBox(width: 5),
                          Text('${pet.age} year',
                              style: AppStyle.petAgeTextStyle)
                        ]),
                        Row(children: [
                          Image.asset(AppAssets.iconPetGender),
                          SizedBox(width: 5),
                          Text(pet.gender ? 'Boy' : 'Girl',
                              style: AppStyle.petAgeTextStyle)
                        ]),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
