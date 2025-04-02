import 'package:flutter/material.dart';
import 'package:islami_app/providers/provider.dart';
import 'package:islami_app/tabs/qurantabs/suraview_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_icons.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class mostRecently extends StatefulWidget {
  String suraNameAR;
  String suraNameEN;
  String numOfVerses;
  int index;

  mostRecently(this.suraNameEN, this.suraNameAR, this.numOfVerses, this.index);

  @override
  State<mostRecently> createState() => _mostRecentlyState();
}

class _mostRecentlyState extends State<mostRecently> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostRecentListProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(suraview.routName, arguments: widget.index);
      },
      child: Container(
        height: height * 0.16,
        width: width * 0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appColors.PrimaryColor,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                children: [
                  Text(widget.suraNameEN, style: appStyles.bold24Black),
                  Text(widget.suraNameAR, style: appStyles.bold24Black),
                  Text(widget.numOfVerses, style: appStyles.bold14Black),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ),
            Spacer(),
            Image.asset(appicons.mostRicon),
          ],
        ),
      ),
    );
  }
}

//"el-fatiha"
//"7 verses"
//"الفاتحه"
