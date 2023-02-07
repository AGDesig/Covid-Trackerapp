import 'package:flutter/material.dart';

class CustomRowDataWidget2 extends StatefulWidget {
  final String name;
  final String title;

  CustomRowDataWidget2({Key? key, required this.name, required this.title})
      : super(key: key);

  @override
  State<CustomRowDataWidget2> createState() => _CustomRowDataWidget2State();
}

class _CustomRowDataWidget2State extends State<CustomRowDataWidget2> {
  @override
  Widget build(BuildContext context) {
    var HeightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(
          top: 4,
          left: 10,
          right: 10,
        ),
        height: HeightScreen * 0.06,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("${widget.title}",style: TextStyle(fontSize: 20)), Text("${widget.name}",style: TextStyle(fontSize: 16),)],
        ));
  }
}
