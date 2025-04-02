import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_backgrounds.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/app_styles.dart';

class radioItem extends StatefulWidget {
  String name;

  radioItem(this.name);

  @override
  State<radioItem> createState() => _radioItemState();
}

class _radioItemState extends State<radioItem> {
  @override
  int PlayAndPause = 0;
  String PlayAndPauseState = appicons.PlayIcon;
  int VoleumAndMute = 0;
  String VoleumAndMuteState = appicons.VolumeIcon;
  String radioBgState = backGround.RadioBGoff;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: appColors.PrimaryColor,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Image(
              image: AssetImage(radioBgState),
              fit: BoxFit.fill,
              width: double.infinity,
              height: 133,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.03),
              Text(
                widget.name,
                style: appStyles.bold24Black,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.01),
              Center(
                child: Row(
                  children: [
                    Visibility(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.transparent),
                      ),
                      visible: true,
                    ),
                    IconButton(
                      onPressed: () {
                        editPlayAndPauseState();
                      },
                      icon: Image.asset(PlayAndPauseState),
                      alignment: Alignment.center,
                    ),
                    SizedBox(),
                    IconButton(
                      onPressed: () {
                        volumeAndMuteState();
                      },
                      icon: Image.asset(VoleumAndMuteState),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void editPlayAndPauseState() {
    if (PlayAndPause == 0) {
      PlayAndPause = 1;
      PlayAndPauseState = appicons.PauseIcon;
      radioBgState = backGround.RadioBGon;
      setState(() {});
    } else if (PlayAndPause == 1) {
      PlayAndPause = 0;
      PlayAndPauseState = appicons.PlayIcon;
      radioBgState = backGround.RadioBGoff;
      setState(() {});
    }
  }

  void volumeAndMuteState() {
    if (VoleumAndMute == 0) {
      VoleumAndMute = 1;
      VoleumAndMuteState = appicons.NoVolumeIcon;
      setState(() {});
    } else if (VoleumAndMute == 1) {
      VoleumAndMute = 0;
      VoleumAndMuteState = appicons.VolumeIcon;
      setState(() {});
    }
  }
}
