import 'package:covid_tracker_app/screen/world_home_screen.dart';
import 'package:covid_tracker_app/splash_screen/covid_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        WorldHomeScreen.RouteName: (context) => WorldHomeScreen()
      },
      home: Scaffold(
        body: SplashScreen(),

      ),

    );
  }
}
