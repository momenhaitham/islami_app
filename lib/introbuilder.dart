import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introbuild extends StatelessWidget {
  String imagepath;
  String text1;
  String text2;

  introbuild(this.imagepath, this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagepath),
        Text(
          text1,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
        SizedBox(height: 10),
        Text(
          text2,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
      ],
    );
  }
}
