import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadithtabs/hadith_tab.dart';
import 'package:islami_app/tabs/qurantabs/quran_tab.dart';
import 'package:islami_app/tabs/radiotabs/radiotab.dart';
import 'package:islami_app/tabs/sebhatabs/sebha_tab.dart';
import 'package:islami_app/tabs/timetabs/time_tab.dart';
import 'package:islami_app/utils/app_backgrounds.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedItem = 0;

  @override
  List<String>appBGs = [
    backGround.quranBG,
    backGround.hadethBG,
    backGround.sebhaBG,
    backGround.radioBG,
    backGround.timeBG
  ];

  List<Widget>Apptabs = [
    quranTab(),
    hadithTab(),
    sebhatab(),
    radiotab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Stack(
      children: [
        Container(child: Image.asset(appBGs[selectedItem], fit: BoxFit.fill,),
          height: double.infinity,
          width: double.infinity,),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon:
            selectedItem == 0 ? Container(
              child: ImageIcon(AssetImage(appicons.QuranIcon)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                  color: appColors.BlackColor),
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            ) : ImageIcon(AssetImage(appicons.QuranIcon)),
              label: "Quran",
            ),
            BottomNavigationBarItem(icon:
            selectedItem == 1 ? Container(
              child: ImageIcon(AssetImage(appicons.HadethIcon)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                  color: appColors.BlackColor),
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            ) : ImageIcon(AssetImage(appicons.HadethIcon)),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(icon:
            selectedItem == 2 ? Container(
              child: ImageIcon(AssetImage(appicons.SebhaIcon)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                  color: appColors.BlackColor),
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            ) : ImageIcon(AssetImage(appicons.SebhaIcon)),
              label: "Sebha",
            ),
            BottomNavigationBarItem(icon:
            selectedItem == 3 ? Container(
              child: ImageIcon(AssetImage(appicons.RadioIcon)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                  color: appColors.BlackColor),
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            ) : ImageIcon(AssetImage(appicons.RadioIcon)),
              label: "Radio",
            ),
            BottomNavigationBarItem(icon:
            selectedItem == 4 ? Container(
              child: ImageIcon(AssetImage(appicons.TimeIcon)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
                  color: appColors.BlackColor),
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
            ) : ImageIcon(AssetImage(appicons.TimeIcon)),
              label: "Time",
            )
          ],
            showUnselectedLabels: false,
            currentIndex: selectedItem,
            onTap: (index) {
              selectedItem = index;
              setState(() {

              });
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
            [
              Container(child: Image.asset(backGround.primaryLogo),
                width: double.infinity,
                height: height * 0.20,
              ),
              Expanded(child: Apptabs[selectedItem])
            ],
          ),
        ),
      ],
    );
  }
}
