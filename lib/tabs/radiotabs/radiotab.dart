import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:islami_app/tabs/radiotabs/radioitem_builder.dart';
import 'package:islami_app/utils/app_backgrounds.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';

class radiotab extends StatefulWidget {
  radiotab({super.key});

  TextStyle buttonbarUnSelect1 = appStyles.bold16Black;
  TextStyle buttonbarUnSelect2 = appStyles.bold16White;

  @override
  State<radiotab> createState() => _radiotabState();
}

class _radiotabState extends State<radiotab> {
  @override
  int ButtonBarindex = 0;
  List<radioItem> RadioItems = [
    radioItem("Radio Ibrahim Al-Akdar"),
    radioItem("Radio Al-Qaria Yassen"),
    radioItem("Radio Ahmed Al-trabulsi"),
    radioItem("Radio Addokali Mohammad Alalim"),
  ];
  List<radioItem> RecitersItems = [
    radioItem("Ibrahim Al-Akdar"),
    radioItem("Akram Alalaqmi"),
    radioItem("Majed Al-Enezi"),
    radioItem("Malik shaibat Alhamed"),
  ];

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          AnimatedButtonBar(
            children: [
              ButtonBarEntry(
                onTap: () {
                  ButtonBarindex = 0;
                  setState(() {});
                },
                child: Text("radio", style: widget.buttonbarUnSelect2),
              ),
              ButtonBarEntry(
                onTap: () {
                  ButtonBarindex = 1;
                  setState(() {});
                },
                child: Text('Reciters', style: widget.buttonbarUnSelect2),
              ),
            ],
            backgroundColor: appColors.vBlackColor,
            foregroundColor: appColors.PrimaryColor,
            invertedSelection: true,
            borderWidth: 12,
            radius: 12,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (ButtonBarindex == 0) {
                  return RadioItems[index];
                } else {
                  return RecitersItems[index];
                }
              },
              itemCount:
                  ButtonBarindex == 0
                      ? RadioItems.length
                      : RecitersItems.length,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
