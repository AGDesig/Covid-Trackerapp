import 'package:covid_tracker_app/CustomWidgets/custom_row_data_widget.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/custom_row_data_widget2.dart';
import '../CustomWidgets/custom_row_data_widget3.dart';

class DetailOfEachScreen extends StatefulWidget {
  final String flag;
  final String name, continent;
  final int cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      population;

  const DetailOfEachScreen(
      {Key? key,
      required this.flag,
      required this.name,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.todayRecovered,
      required this.active,
      required this.critical,
      required this.population,
      required this.continent})
      : super(key: key);

  @override
  State<DetailOfEachScreen> createState() => _DetailOfEachScreenState();
}

class _DetailOfEachScreenState extends State<DetailOfEachScreen> {
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,centerTitle: true, title: Text(widget.name)),
      body: SingleChildScrollView(
          child: Container(color: Colors.black12,
        height: heightScreen,
        width: widthScreen,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 3),
            height: heightScreen * 0.19,
            width: widthScreen * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage("${widget.flag}", scale: 1.07)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            color: Colors.grey.shade400,
            width: widthScreen,
            height: heightScreen * 0.2,
            child: ListView(children: [
              CustomRowDataWidget2(
                  title: "Country Name", name: "${widget.name}"),
              CustomRowDataWidget2(
                  title: "Continent", name: "${widget.continent}"),
              CustomRowDataWidget2(
                  title: "Population",
                  name: "${widget.population.toString()}"),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: heightScreen * 0.01),
            height: heightScreen * 0.45,
            width: widthScreen * 0.9,
            color: Colors.black,
            child: GridView.count(
              childAspectRatio: 2,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              children: [
                CustomRowData3(Name: "Overall Cases", data: widget.cases),
                CustomRowData3(Name: "Today Cases", data: widget.todayCases),
                CustomRowData3(Name: "Deaths", data: widget.deaths),
                CustomRowData3(Name: "Today Deaths", data: widget.todayDeaths),
                CustomRowData3(Name: "Recovered", data: widget.recovered),
                CustomRowData3(Name: "Today Recovered", data: widget.todayRecovered),
                CustomRowData3(Name: "Active", data: widget.active),
                CustomRowData3(Name: "Critical", data: widget.critical),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
