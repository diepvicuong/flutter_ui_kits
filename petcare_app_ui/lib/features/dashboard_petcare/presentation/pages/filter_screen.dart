import 'package:flutter/material.dart';
import 'package:petcare/features/dashboard_petcare/presentation/pages/export.dart';
import 'package:petcare/res/colors.dart';
import 'package:petcare/res/sizes.dart';
import 'package:petcare/res/styles.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailPageAppBar(),
            SizedBox(height: 20),
            CustomChoiceWidget(
              title: 'The Gender',
              listItem: ['Male', 'Female', 'Both'],
            ),
            SizedBox(height: 20),
            CustomChoiceWidget(
              title: 'Adoption Type',
              listItem: ['Temporary', 'Permanent'],
            ),
            SizedBox(height: 20),
            CustomChoiceWidget(
              title: 'The Size',
              listItem: ['Small', 'Medium', 'Large', 'X Large'],
            ),
            SizedBox(height: 20),
            CustomSlideBarWidget(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.homePagePadding),
              child: CustomChipWidget(
                height: 50,
                text: "Save",
                hightlightColor: Colors.grey[500],
                isActive: true,
                onTap: () {
                  print("Save");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomChoiceWidget extends StatefulWidget {
  final String? title;
  final List<String> listItem;

  const CustomChoiceWidget({Key? key, this.title, required this.listItem})
      : super(key: key);

  @override
  _CustomChoiceWidgetState createState() => _CustomChoiceWidgetState();
}

class _CustomChoiceWidgetState extends State<CustomChoiceWidget> {
  int _indexActive = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.homePagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.title != null
              ? Text(
                  '${widget.title}',
                  textAlign: TextAlign.start,
                  style: AppStyle.petNameTextStyle,
                )
              : Container(),
          SizedBox(height: 10),
          GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 3.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List<Widget>.generate(widget.listItem.length, (index) {
              return CustomChipWidget(
                text: widget.listItem[index],
                isActive: index == _indexActive,
                onTap: () {
                  setState(() {
                    _indexActive = index;
                  });
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

class CustomSlideBarWidget extends StatefulWidget {
  @override
  _CustomSlideBarWidgetState createState() => _CustomSlideBarWidgetState();
}

class _CustomSlideBarWidgetState extends State<CustomSlideBarWidget> {
  final double _minValue = 6; //6 months
  final double _maxValue = 12 * 8; //8 years
  double _currentSliderValue = 0;

  @override
  void initState() {
    _currentSliderValue = (_maxValue + _minValue) / 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.homePagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Age',
            style: AppStyle.petNameTextStyle,
          ),
          SizedBox(height: 30),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              showValueIndicator: ShowValueIndicator.always,
              inactiveTrackColor: AppColor.searchBarColor,
              activeTrackColor: AppColor.kprimaryColor,
              thumbColor: AppColor.kprimaryColor,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.transparent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            child: Slider(
              min: _minValue,
              max: _maxValue,
              value: _currentSliderValue,
              label: displayIndicator(
                  _minValue.round(), _currentSliderValue.round()),
              onChanged: (value) {
                print("$value");
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('6 Mon'),
              Text('8 Yrs'),
            ],
          )
        ],
      ),
    );
  }

  String displayIndicator(int minValue, int currentValue) {
    final minYear = minValue ~/ 12;
    final currentYear = currentValue ~/ 12;
    final minString = minYear > 0 ? "$minYear Yrs" : "$minValue Mon";
    final currentString =
        currentYear > 0 ? "$currentYear Yrs" : "$currentValue Mon";

    return "$minString - $currentString";
  }
}
