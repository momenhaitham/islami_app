import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/intro_screen.dart';
import 'package:islami_app/providers/provider.dart';
import 'package:islami_app/tabs/hadithtabs/hadeethview_screen.dart';
import 'package:islami_app/tabs/qurantabs/suraview_screen.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:islami_app/tabs/qurantabs/mostrecently_part_builder.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(), create: (context) => MostRecentListProvider(),));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName: (context) => IntroScreen(),
        homeScreen.routeName: (context) => homeScreen(),
        suraview.routName: (context) => suraview(),
        Hadeethview.routName: (context) => Hadeethview()
      },
      darkTheme: appTheme.Darktheme,
      themeMode: ThemeMode.dark,
    );
  }
}


