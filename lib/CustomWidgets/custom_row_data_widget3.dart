import 'package:flutter/material.dart';

class CustomRowData3 extends StatefulWidget {
  final String Name;
  final int data;

  const CustomRowData3({Key? key, required this.Name, required this.data})
      : super(key: key);

  @override
  State<CustomRowData3> createState() => _CustomRowData3State();
}

class _CustomRowData3State extends State<CustomRowData3> {
  @override
  Widget build(BuildContext context) {
    var HeightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Container(alignment: Alignment.center,
      color: Colors.white,
      width: widthScreen * 1,
      height: HeightScreen * 1,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text("${widget.Name}",style: TextStyle(fontSize: 20)), Text("${widget.data}",style: TextStyle(fontSize: 16),)]),
    );
  }
}
