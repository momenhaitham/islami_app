import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/qurantabs/surasdetails.dart';
import 'package:islami_app/tabs/qurantabs/mostrecently_part_builder.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';

class suraview extends StatefulWidget {
  static const String routName = "suraview";

  @override
  State<suraview> createState() => _suraviewState();
}

class _suraviewState extends State<suraview> {
  String SuraContent = "";
  late MostRecentListProvider provider;

  @override
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var index = ModalRoute.of(context)?.settings.arguments as int;
    provider = Provider.of<MostRecentListProvider>(context);

    if (SuraContent.isEmpty) {
      loadcontentfromfile(index);
    }
    return Scaffold(
      backgroundColor: appColors.vBlackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: appColors.PrimaryColor),
        backgroundColor: appColors.vBlackColor,
        title: Text(
          surasDetails.englishQuranSurahs[index],
          style: appStyles.bold24Black.copyWith(color: appColors.PrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                child: Image.asset("assets/images/Mask group.png"),
                margin: EdgeInsets.only(left: width * 0.02),
              ),
              Text(
                surasDetails.arabicQuranSuras[index],
                style: appStyles.bold24Priamry,
              ),
              Container(
                child: Image.asset("assets/images/Mask group2.png"),
                margin: EdgeInsets.only(right: width * 0.02),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SuraContent.isEmpty
              ? Center(
                child: CircularProgressIndicator(color: appColors.PrimaryColor),
              )
              : Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      SuraContent,
                      style: appStyles.bold24Priamry,
                      textDirection: TextDirection.rtl,
                    );
                  },
                  itemCount: 1,
                ),
              ),
          Image(image: AssetImage("assets/images/Mask group3.png")),
        ],
      ),
    );
  }

  void dispose() {
    super.dispose();
    provider.readMostRecentSura();
  }

  void loadcontentfromfile(int index) async {
    String content = await rootBundle.loadString(
      "assets/files/suras/${index + 1}.txt",
    );
    List<String> suralines = content.split('\n');
    //int numOfVerses =int.parse(surasDetails.AyaNumber[index]);
    for (int i = 0; i < suralines.length; i++) {
      SuraContent = SuraContent + suralines[i] + "[${i + 1}] ";
    }
    setState(() {});
  }
}
