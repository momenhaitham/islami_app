import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app/utils/app_colors.dart';

import 'hadith_builder.dart';

class hadithTab extends StatelessWidget {
  const hadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<int> HadithIndexes = List.generate(50, (index) => index);
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.75,
        //aspectRatio:16/9 ,
        enlargeCenterPage: true,
        animateToClosest: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        initialPage: 0,
      ),
      items:
          HadithIndexes.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Expanded(child: hadethBuilder(i));
              },
            );
          }).toList(),
    );
  }
}
