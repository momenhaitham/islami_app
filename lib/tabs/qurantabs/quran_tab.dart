import 'package:flutter/material.dart';
import 'package:islami_app/tabs/qurantabs/mostrecently_builder.dart';
import 'package:islami_app/tabs/qurantabs/surasdetails.dart';
import 'package:islami_app/tabs/qurantabs/suraview_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/tabs/qurantabs/suraslist_builder.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';

import 'mostrecently_part_builder.dart';

class quranTab extends StatefulWidget {
  @override
  State<quranTab> createState() => _quranTabState();
}

class _quranTabState extends State<quranTab> {
  List<int> surasIndexes = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    List<int> MostRecently = [];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: appColors.PrimaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 2, color: appColors.PrimaryColor),
              ),
              prefixIcon: Image.asset(appicons.quranicontTxtfield),
              hintText: "Suras Name",
              hintStyle: appStyles.bold16White,
            ),
            cursorColor: appColors.PrimaryColor,
            onChanged: (name) {
              filterList(name);
            },
            style: appStyles.bold16White,
          ),
          SizedBox(height: height * 0.02),
          mostRecentlyPart(),
          SizedBox(height: height * 0.02),
          Text("Suras List", style: appStyles.bold16White),
          SizedBox(height: height * 0.02),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return suralist(surasIndexes[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                    color: appColors.whiteColor,
                    indent: width * 0.07,
                    endIndent: width * 0.07,
                  );
                },
                itemCount: surasIndexes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  filterList(String name) {
    List<int> FilteredList = [];
    for (int i = 0; i < 114; i++) {
      if (surasDetails.arabicQuranSuras[i].contains(name)) {
        FilteredList.add(i);
      } else if (surasDetails.englishQuranSurahs[i].toLowerCase().contains(
        name.toLowerCase(),
      )) {
        FilteredList.add(i);
      }

      surasIndexes = FilteredList;
      setState(() {});
    }
  }
}

//height: height*0.249
/*
InkWell(child: suralist(surasIndexes[index]),onTap: (){
                      WriteMostRecentSura(surasIndexes[index]);
                      Navigator.of(context).pushNamed(suraview.routName,arguments: surasIndexes[index]);
                    },)
 */
