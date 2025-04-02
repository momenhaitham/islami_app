//import 'package:flutter/cupertino.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/utils/app_backgrounds.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:animated_rotation/animated_rotation.dart' as rotation;
import 'package:lottie/lottie.dart';

class sebhatab extends StatefulWidget {
  sebhatab({super.key});

  int counter = 0;
  int zikrNum = 0;

  @override
  State<sebhatab> createState() => _sebhatabState();
}

class _sebhatabState extends State<sebhatab> {
  @override
  BigInt rotate = BigInt.zero;

  Widget build(BuildContext context) {
    List<String> azkar = [
      "سُبْحَانَ اللَّهِ",
      "الْحَمْدُ لِلَّهِ",
      "لَا إِلَهَ إِلَّا اللَّهُ ",
      "اللَّهُ أَكْبَرُ ",
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Center(
          child: Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: appStyles.bold26White,
          ),
        ),
        SizedBox(height: height * 0.04),
        InkWell(
          onTap: () {
            rotate += BigInt.from(360);
            widget.counter++;
            if (widget.counter > 33) {
              widget.zikrNum++;
              widget.counter = 0;
            }
            if (widget.zikrNum == azkar.length) {
              widget.zikrNum = 0;
            }
            setState(() {});
          },
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: rotation.AnimatedRotation(
                    angle: rotate.toInt(),
                    child: Image.asset(backGround.sebha),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: height * 0.04),
                    Text(
                      azkar[widget.zikrNum],
                      style: appStyles.bold26White.copyWith(fontSize: 36),
                    ),
                    SizedBox(height: height * 0.04),
                    Text(
                      widget.counter.toString(),
                      style: appStyles.bold26White.copyWith(fontSize: 36),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//Lottie.asset("assets/images/azkar.json"),
/*

 */
