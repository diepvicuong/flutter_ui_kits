import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcare/features/dashboard_petcare/presentation/controller/getx_controller.dart';
import 'package:petcare/features/dashboard_petcare/presentation/pages/export.dart';
import 'package:petcare/features/dashboard_petcare/presentation/widgets/export.dart';
import 'package:petcare/res/export.dart';
import 'package:petcare/res/sample_value.dart';
import 'package:petcare/core/widgets/border_text_form_field.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.homePagePadding),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(),
              SizedBox(height: 10),
              SearchBarWidget(),
              SizedBox(height: 20),
              CustomTabBar(
                activeIndex: controller.activeIndex.value,
                onTap: (index) {
                  print("CustomTabBar onTap: $index");
                  controller.updateIndex(index);
                },
              ),
              Obx(() =>
                  IndexedStack(index: controller.activeIndex.value, children: [
                    Center(child: Text('Squirrel Page')),
                    Center(child: Text('Dog Page')),
                    StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      itemCount: listPet.length,
                      itemBuilder: (context, index) => PetCardItem(
                        height: index.isEven ? 300 : 260,
                        pet: listPet[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  pet: listPet[index],
                                ),
                              ));
                        },
                      ),
                      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 18.0,
                      crossAxisSpacing: 20.0,
                    ),
                    Center(child: Text('Fish Page')),
                    Center(child: Text('Turtle Page')),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatefulWidget {
  final ValueChanged<int> onTap;
  final int activeIndex;
  const CustomTabBar({
    Key? key,
    required this.onTap,
    required this.activeIndex,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int _activeIndex;
  @override
  void initState() {
    super.initState();
    _activeIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20.0,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: listType.length,
        itemBuilder: (context, index) {
          return PetTypeWidget(
            type: listType[index],
            isActive: index == _activeIndex ? true : false,
            onTap: () {
              widget.onTap(index);
              setState(() {
                _activeIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Container(
            child: Image.asset(
              AppAssets.iconHomeMenu,
              fit: BoxFit.none,
              width: 50,
            ),
            decoration: BoxDecoration(
                color: AppColor.kprimaryColor,
                borderRadius: BorderRadius.circular(14)),
          ),
          SizedBox(width: 20),
          RichText(
              text: TextSpan(
                  text: "Pet's ",
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kprimaryColor),
                  children: <TextSpan>[
                TextSpan(
                  text: 'Care',
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: AppColor.kprimaryColor),
                )
              ])),
        ],
      ),
      actions: [
        Container(
          child: Image.asset(
            AppAssets.imgUser2,
          ),
        )
      ],
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: BorderTextFormField(
              backgroundColor: AppColor.searchBarColor,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              borderRadius: AppSize.commonBorderRadius,
              hintText: 'Miami, Florida',
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FilterPage()));
            },
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.searchBarColor,
                    borderRadius:
                        BorderRadius.circular(AppSize.commonBorderRadius)),
                child: Icon(Icons.tune)),
          ),
        ],
      ),
    );
  }
}
