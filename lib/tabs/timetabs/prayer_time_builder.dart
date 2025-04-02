import 'package:flutter/cupertino.dart';

import '../../utils/app_backgrounds.dart';
import '../../utils/app_styles.dart';

class PrayerTimeBuilder extends StatelessWidget {
  String PrayerName;
  String PrayerDate;
  String PrayerTime;

  PrayerTimeBuilder(this.PrayerName, this.PrayerDate, this.PrayerTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Image.asset(
            backGround.PrayerTimeBG,
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          Column(
            children: [
              Center(child: Text(PrayerName, style: appStyles.bold16White)),
              Center(child: Text(PrayerDate, style: appStyles.bold16White)),
              Center(child: Text(PrayerTime, style: appStyles.bold16White)),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
      height: 128,
      width: 105,
    );
  }
}
