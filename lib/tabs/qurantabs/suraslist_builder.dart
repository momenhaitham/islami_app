import 'package:flutter/material.dart';
import 'package:islami_app/tabs/qurantabs/surasdetails.dart';
import 'package:islami_app/tabs/qurantabs/suraview_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';

class suralist extends StatelessWidget {
  int index;

  suralist(this.index);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostRecentListProvider>(context);

    return InkWell(
      onTap: () {
        provider.WriteMostRecentSura(index);
        Navigator.of(context).pushNamed(suraview.routName, arguments: index);
      },
      child: Row(
        children: [
          Stack(
            children: [
              Image(image: AssetImage(appicons.Vector)),
              Text("${index + 1}", style: appStyles.bold16White),
            ],
            alignment: Alignment.center,
          ),
          SizedBox(width: width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                surasDetails.englishQuranSurahs[index],
                style: appStyles.bold20White,
              ),
              Text(surasDetails.AyaNumber[index], style: appStyles.bold16White),
            ],
          ),
          Spacer(),
          Text(
            surasDetails.arabicQuranSuras[index],
            style: appStyles.bold20White,
          ),
        ],
      ),
    );
  }
}
