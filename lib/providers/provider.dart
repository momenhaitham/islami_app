import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pref_utils.dart';

class MostRecentListProvider extends ChangeNotifier {
  List<int> MostRecentList = [];

  void readMostRecentSura() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    List<String> MostRecentListasString =
        share.getStringList(sharedPrefs.MostRecentPref) ?? [];
    MostRecentList =
        MostRecentListasString.map((element) {
          return int.parse(element);
        }).toList();
    //MostRecentListasInt.removeRange(0,MostRecentListasInt.length);
    notifyListeners();
  }

  void WriteMostRecentSura(int index) async {
    bool chick = true;
    SharedPreferences share = await SharedPreferences.getInstance();
    List<String> MostRecentList =
        share.getStringList(sharedPrefs.MostRecentPref) ?? [];
    if (MostRecentList.length > 2) {
      MostRecentList.removeLast();
    }
    for (int i = 0; i < MostRecentList.length; i++) {
      int num = int.parse(MostRecentList[i]);
      if (num == index) {
        MostRecentList.removeAt(num);
      }
    }

    if (chick == true) {
      MostRecentList.insert(0, "${index}");
    }
    await share.setStringList(sharedPrefs.MostRecentPref, MostRecentList);
  }

  void editMostRecentList(int index) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    List<String> MostRecentListasString =
        shared.getStringList(sharedPrefs.MostRecentPref) ?? [];
    MostRecentList =
        MostRecentListasString.map((element) {
          return int.parse(element);
        }).toList();
    for (int i = 0; i < MostRecentList.length; i++) {
      if (MostRecentList[i] == index) {
        MostRecentList.remove(index);
      }
    }
    MostRecentList.insert(0, index);
    MostRecentListasString = MostRecentList.map((element) {
      return "${element}";
    }).toList();
    await shared.setStringList(
        sharedPrefs.MostRecentPref, MostRecentListasString);
  }
}
