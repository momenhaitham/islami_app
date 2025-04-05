import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadithtabs/hadeeth_model.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';

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
          Stack(
            children: [
              Row(
                children: [
                  Container(
                    child: Image.asset("assets/images/Mask group.png"),
                    margin: EdgeInsets.only(left: width * 0.02),
                  ),
                  Container(
                    child: Image.asset("assets/images/Mask group2.png"),
                    margin: EdgeInsets.only(right: width * 0.02),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Container(
                  height: height * 0.094,
                  child: Center(child: Text(HadeethDetails.HedeethTitle,
                      style: appStyles.bold24Priamry),))
            ],
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
