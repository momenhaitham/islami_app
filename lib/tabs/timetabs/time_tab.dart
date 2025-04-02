import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/tabs/timetabs/prayer_time_builder.dart';
import 'package:islami_app/utils/app_backgrounds.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  TimeTab({super.key});

  List<Widget> PrayersList = [
    PrayerTimeBuilder("Fajr", "4:18", "AM"),
    PrayerTimeBuilder("Duhr", "12:04", "PM"),
    PrayerTimeBuilder("Asr", "3:36", "PM"),
    PrayerTimeBuilder("Maghrib", "6:19", "PM"),
    PrayerTimeBuilder("Isha", "7:39", "PM"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.34,
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Stack(
            children: [
              Image.asset(backGround.brownBGtimetab, height: height * 0.34),
              Image.asset(backGround.bageBGtimetab, height: height * 0.34),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06, vertical: height * 0.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("16 jul \n 2024", style: appStyles.bold20White),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Pray Time",
                              style: appStyles.bold24Black.copyWith(
                                color: appColors.BlackColor,
                              ),
                            ),
                            Text("Tuesday", style: appStyles.bold24Black),
                          ],
                        ),
                        Text("09 Muh \n 1446", style: appStyles.bold20White),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Center(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          //aspectRatio:16/9 ,
                          pageSnapping: true,
                          enlargeCenterPage: true,
                          animateToClosest: true,
                          //padEnds: false,
                          viewportFraction: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          initialPage: 0,
                        ),
                        items: PrayersList,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Next Pray - 02:32",
                            style: appStyles.bold16Black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Container(
          child: Text(
            "Azkar",
            style: appStyles.bold24Priamry.copyWith(fontSize: 16),
          ),
          margin: EdgeInsets.only(left: width * 0.05),
        ),
        SizedBox(height: height * 0.02),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: appColors.PrimaryColor, width: 3),
                color: appColors.vBlackColor,
              ),
              child: Column(
                children: [
                  Image.asset(appicons.EveningAzkarIcon),
                  Text("Evening Azkar", style: appStyles.bold20White),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: height * 0.27,
              width: width * 0.43,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: appColors.PrimaryColor, width: 3),
                color: appColors.vBlackColor,
              ),
              child: Column(
                children: [
                  Image.asset(appicons.MorningAzkarIcon),
                  Text("Morning Azkar", style: appStyles.bold20White),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: height * 0.27,
              width: width * 0.43,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ],
    );
  }
}
