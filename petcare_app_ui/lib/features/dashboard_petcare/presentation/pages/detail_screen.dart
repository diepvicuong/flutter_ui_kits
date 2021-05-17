import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petcare/core/widgets/marquee.dart';
import 'package:petcare/features/dashboard_petcare/data/models/pet_item.dart';
import 'package:petcare/res/assets.dart';
import 'package:petcare/res/export.dart';

class DetailPage extends StatelessWidget {
  final PetItem pet;

  const DetailPage({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Hero(
                          tag: '${pet.name}_${pet.image}',
                          child: Image.asset(
                            pet.image,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: AppColor.kBackgroundColor,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: DetailPageAppBar(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 140 / 2,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSize.homePagePadding),
                          height: 140,
                          margin: EdgeInsets.symmetric(
                              horizontal: AppSize.homePagePadding),
                          decoration: AppStyle.whiteBoxDecoration,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppAssets.iconPetFoot,
                                    color: AppColor.kprimaryColor,
                                    scale: 0.7,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    pet.type,
                                    style: AppStyle.petTypeTextStyle,
                                  ),
                                  SizedBox(width: 10.0),
                                  Image.asset(
                                    AppAssets.iconPetFoot,
                                    color: AppColor.kprimaryColor,
                                    scale: 0.7,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Name',
                                        style: AppStyle.petNameTextStyle,
                                      ),
                                      Text(
                                        pet.name,
                                        style: AppStyle.petAgeTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Age',
                                        style: AppStyle.petNameTextStyle,
                                      ),
                                      Text(
                                        '${pet.age} year old',
                                        style: AppStyle.petAgeTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sex',
                                        style: AppStyle.petNameTextStyle,
                                      ),
                                      Text(
                                        pet.gender ? 'Male' : 'Female',
                                        style: AppStyle.petAgeTextStyle,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.place_outlined,
                                      color: AppColor.kprimaryColor),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                    child: MarqueeWidget(
                                      child: Text(
                                        '80/9 Le Hong Phong P2 Q5 Tp Ho Chi Minh',
                                        style: AppStyle.petAgeTextStyle,
                                        maxLines: 2,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(
                              left: AppSize.homePagePadding,
                              right: AppSize.homePagePadding),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                padding:
                                    EdgeInsets.all(AppSize.homePagePadding),
                                decoration: AppStyle.whiteBoxDecoration,
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        pet.host.imgAvatar,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${pet.host.name}'),
                                        Text('${pet.host.email}'),
                                        Text('${pet.host.birthDate}'),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Holder'),
                                        Text('\$${pet.host.price}'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              GridView.count(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                children: List<Widget>.generate(
                                    listCategories.length, (index) {
                                  bool isActive = false;
                                  if (index == 0)
                                    isActive = pet.category.toiletTrained;
                                  else if (index == 1)
                                    isActive = pet.category.spay;
                                  else if (index == 2)
                                    isActive = pet.category.goodWithCats;
                                  else if (index == 3)
                                    isActive = pet.category.likeToWalk;
                                  else if (index == 4)
                                    isActive = pet.category.goodWithKids;
                                  else if (index == 5)
                                    isActive = pet.category.itNotBite;
                                  return CustomChipWidget(
                                    text: listCategories[index],
                                    isActive: isActive,
                                  );
                                }),
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 2.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(AppSize.homePagePadding),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.commonBorderRadius),
                  topRight: Radius.circular(AppSize.commonBorderRadius),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.kprimaryColor,
                              borderRadius: BorderRadius.circular(
                                  AppSize.commonBorderRadius)),
                          child: Text(
                            'Adoption',
                            style: AppStyle.adoptionTextStyle,
                          ))),
                  SizedBox(width: 20),
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppColor.kprimaryColor,
                          borderRadius: BorderRadius.circular(
                              AppSize.commonBorderRadius)),
                      child: HeartWidget(
                        isLike: false,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeartWidget extends StatefulWidget {
  bool isLike;

  HeartWidget({
    Key? key,
    required bool isLike,
  })   : this.isLike = isLike,
        super(key: key);

  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
        child: IconButton(
            key: UniqueKey(),
            icon: Icon(
              Icons.favorite,
              color: widget.isLike ? Colors.red : AppColor.kSecondaryColor,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                widget.isLike = !widget.isLike;
              });
            }));
  }
}

class CustomChipWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isActive;
  final double height;
  final Color? hightlightColor;
  const CustomChipWidget(
      {Key? key,
      required this.text,
      this.onTap,
      this.isActive = false,
      this.height = 30.0,
      this.hightlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: hightlightColor,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.commonBorderRadius),
            color:
                isActive ? AppColor.kprimaryColor : AppColor.kSecondaryColor),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isActive ? AppColor.kSecondaryColor : Colors.grey[400]),
        ),
      ),
      onTap: onTap,
    );
  }
}

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: AppSize.homePagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back),
              decoration: BoxDecoration(
                  color: AppColor.kSecondaryColor,
                  borderRadius: BorderRadius.circular(14)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.bookmark_outline),
            decoration: BoxDecoration(
                color: AppColor.kSecondaryColor,
                borderRadius: BorderRadius.circular(14)),
          )
        ],
      ),
    );
  }
}
