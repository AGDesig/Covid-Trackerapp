import 'dart:async';

import 'package:covid_tracker_app/screen/world_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker_app/screen/world_home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  static String RouteName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 7),
      () => Navigator.pushReplacementNamed(context, WorldHomeScreen.RouteName),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 200,
                  width: widthScreen,
                  child:
                      Image(image: AssetImage("assets/images/covidlogo.png")),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animationController.value * 2.0 * math.pi,
                    child: child,
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                width: widthScreen,
                child: Text("Covid- 19\nWorld Case Info App",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              )
            ],
          ))),
    );
  }
}
