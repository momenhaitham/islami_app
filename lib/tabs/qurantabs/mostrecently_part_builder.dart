import 'package:flutter/material.dart';
import 'package:islami_app/tabs/qurantabs/surasdetails.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';
import 'package:provider/provider.dart';
import '../../providers/provider.dart';
import 'mostrecently_builder.dart';

final GlobalKey<_mostRecentlyPartState> firstScreenKey =
    GlobalKey<_mostRecentlyPartState>();

class mostRecentlyPart extends StatefulWidget {
  @override
  // TODO: implement key
  Key? get key => firstScreenKey;

  //List<int> MostRecentList = [];
  @override
  State<mostRecentlyPart> createState() => _mostRecentlyPartState();
}

class _mostRecentlyPartState extends State<mostRecentlyPart> {
  late MostRecentListProvider provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.readMostRecentSura();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostRecentListProvider>(context);
    return Visibility(
      visible: provider.MostRecentList.isEmpty ? false : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently", style: appStyles.bold16White),
          SizedBox(height: height * 0.02),
          SizedBox(
            width: double.infinity,
            height: height * 0.17,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return mostRecently(
                  surasDetails.englishQuranSurahs[provider
                      .MostRecentList[index]],
                  surasDetails.arabicQuranSuras[provider.MostRecentList[index]],
                  surasDetails.AyaNumber[provider.MostRecentList[index]],
                  provider.MostRecentList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemCount: provider.MostRecentList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

//"el-fatiha"
//"7 verses"
//"الفاتحه"
