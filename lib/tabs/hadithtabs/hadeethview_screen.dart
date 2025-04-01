import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/tabs/hadithtabs/hadeeth_model.dart';
import 'package:islami_app/tabs/qurantabs/surasdetails.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/utils/shared_pref_utils.dart';

class Hadeethview extends StatefulWidget {
  static const String routName = "Hadeethview";

  @override
  State<Hadeethview> createState() => _suraviewState();
}

class _suraviewState extends State<Hadeethview> {
  String Hadeethview = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    HadeethModel HadeethDetails =
        ModalRoute.of(context)?.settings.arguments as HadeethModel;

    return Scaffold(
      backgroundColor: appColors.vBlackColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: appColors.PrimaryColor),
        backgroundColor: appColors.vBlackColor,
        title: Text(
          "Hadeeth ${HadeethDetails.index + 1}",
          style: appStyles.bold24Priamry,
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
              Text(HadeethDetails.HedeethTitle, style: appStyles.bold24Priamry),
              Container(
                child: Image.asset("assets/images/Mask group2.png"),
                margin: EdgeInsets.only(right: width * 0.02),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),

          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  HadeethDetails.HadeethContent,
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
}
