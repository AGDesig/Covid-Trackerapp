import 'package:flutter/material.dart';

class CustomRowDataWidget extends StatefulWidget {
  final String title;
  final String data;

  const CustomRowDataWidget({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  State<CustomRowDataWidget> createState() => _CustomRowDataWidgetState();
}

class _CustomRowDataWidgetState extends State<CustomRowDataWidget> {
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 3,bottom: 3),
          padding: EdgeInsetsDirectional.only(start: 10,end: 10),
          height: heightScreen * 0.057,
          width: widthScreen,
          decoration: BoxDecoration(color: Colors.black26),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("${widget.title}"), Text("${widget.data}")]));
  }
}
