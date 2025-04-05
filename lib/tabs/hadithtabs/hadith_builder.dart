import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadithtabs/hadeeth_model.dart';
import 'package:islami_app/tabs/hadithtabs/hadeethview_screen.dart';
import 'package:islami_app/utils/app_backgrounds.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../utils/app_colors.dart';

class hadethBuilder extends StatefulWidget {
  int index;

  hadethBuilder(this.index);

  @override
  State<hadethBuilder> createState() => _hadethBuilderState();
}

class _hadethBuilderState extends State<hadethBuilder> {
  String contentOfHadeeth = "";
  String HadeethTitle = "title";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (contentOfHadeeth.isEmpty) {
      loadfilefromhadith(widget.index);
    }
    return InkWell(
      child: Container(
        width: width * 80,
        height: height * 70,
        margin: EdgeInsets.only(bottom: 10, left: 7, right: 7),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: appColors.PrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(backGround.HadeethCardCornerL),
                      Image.asset(backGround.HadeethCardCornerR),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(backGround.HadeethCardBG1),
                        Spacer(),
                        Image.asset(
                          backGround.HadeethCardBG2,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: height * 0.13,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          HadeethTitle,
                          style: appStyles.bold24Black,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  contentOfHadeeth.isEmpty
                      ? Center(
                        child: CircularProgressIndicator(
                          color: appColors.PrimaryColor,
                        ),
                      )
                      : Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            contentOfHadeeth,
                            style: appStyles.bold14Black.copyWith(fontSize: 15),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          Hadeethview.routName,
          arguments: HadeethModel(HadeethTitle, contentOfHadeeth, widget.index),
        );
      },
    );
  }

  void loadfilefromhadith(int index) async {
    String content = await rootBundle.loadString(
      "assets/files/Hadeeth/h${index + 1}.txt",
    );
    HadeethTitle = content.substring(0, content.indexOf("\n"));
    contentOfHadeeth = content.substring(content.indexOf("\n") + 1);

    setState(() {});
  }
}
