import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/introbuilder.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro";

  @override
  State<IntroScreen> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 32, 32, 1),

      body: IntroductionScreen(
        globalBackgroundColor: Color.fromRGBO(32, 32, 32, 1),
        pages: [
          PageViewModel(
            decoration: PageDecoration(
              pageColor: Color.fromRGBO(32, 32, 32, 1),
            ),
            titleWidget: Image.asset("assets/images/Group 32.png"),
            bodyWidget: introbuild(
              "assets/images/Frame 1.png",
              "Welcome To islami App",
              "",
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              pageColor: Color.fromRGBO(32, 32, 32, 1),
            ),
            titleWidget: Image.asset("assets/images/Group 32.png"),
            bodyWidget: introbuild(
              "assets/images/Frame 3.png",
              "Welcome to islami",
              "We Are Very Excited To Have You In Our Community",
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              pageColor: Color.fromRGBO(32, 32, 32, 1),
            ),
            titleWidget: Image.asset("assets/images/Group 32.png"),
            bodyWidget: introbuild(
              "assets/images/Frame 4.png",
              "Reading the Quran",
              "Read, and your Lord is the Most Generous",
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              pageColor: Color.fromRGBO(32, 32, 32, 1),
            ),
            titleWidget: Image.asset("assets/images/Group 32.png"),
            bodyWidget: introbuild(
              "assets/images/Frame 6.png",
              "Bearish",
              "Praise the name of your Lord, the Most High",
            ),
          ),
          PageViewModel(
            decoration: PageDecoration(
              pageColor: Color.fromRGBO(32, 32, 32, 1),
            ),
            titleWidget: Image.asset("assets/images/Group 32.png"),
            bodyWidget: introbuild(
              "assets/images/Frame 10.png",
              "Holy Quran Radio",
              "You can listen to the Holy Quran Radio through the application for free and easily",
            ),
          ),
        ],
        onDone: () {
          Navigator.pushNamed(context, homeScreen.routeName);
        },
        done: Text(
          "Done",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
        back: Text(
          "Back",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
        next: Text(
          "Next",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
        skip: Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(226, 190, 127, 1),
          ),
        ),
        showSkipButton: true,
        showBackButton: true,
        dotsDecorator: DotsDecorator(
          size: Size(8.0, 8.0),
          activeSize: Size(16.0, 8.0),
          activeColor: Color.fromRGBO(226, 190, 127, 1),
          color: Colors.grey,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
  }
}
