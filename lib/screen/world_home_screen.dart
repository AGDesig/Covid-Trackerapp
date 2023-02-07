import 'package:covid_tracker_app/CustomWidgets/custom_row_data_widget.dart';
import 'package:covid_tracker_app/Model/world_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Utilities/covid_world_data.dart';
import 'country_list_search.dart';

class WorldHomeScreen extends StatefulWidget {
  static String RouteName = "/WorldHomeScreen";

  const WorldHomeScreen({Key? key}) : super(key: key);

  @override
  State<WorldHomeScreen> createState() => _WorldHomeScreenState();
}

class _WorldHomeScreenState extends State<WorldHomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    AnimationController _animationController = AnimationController(duration: const Duration(milliseconds: 1000),vsync: this)..repeat();
    CovidDataCallingFromAPI callingFromAPI= CovidDataCallingFromAPI();
    var widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    var heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                StreamBuilder(stream: callingFromAPI.getdatafromAPI(),builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return SpinKitHourGlass(color: Colors.red);
                    }
                  else if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                  else{
                    return Container(
                      height: heightScreen * 0.4,
                      width: widthScreen,
                      child: PieChart(
                        centerText: "Stats",
                        dataMap: {
                          "Total": snapshot.data!.cases.toDouble(),
                          "Recovered": snapshot.data!.recovered.toDouble(),
                          "deaths": snapshot.data!.deaths.toDouble(),
                        },
                        chartType: ChartType.disc,
                        animationDuration: Duration(seconds: 4),
                        degreeOptions: DegreeOptions(initialAngle: 180,totalDegrees: 360),
                        chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,showChartValues: true),

                        colorList: [Colors.blue, Colors.deepOrange, Colors.red],
                      ),
                    );
                  }

                },),

                StreamBuilder<WorldModel>(stream: callingFromAPI.getdatafromAPI(), builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return SpinKitCubeGrid(duration: Duration(seconds: 10),size: 100,color: Colors.red,controller: _animationController);
                    }
                  else if(snapshot.hasError)
                    {
                      return Center(child: Text("${snapshot.error}"),);
                    }
                  return Container(
                    decoration: BoxDecoration(color: Colors.black12),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: heightScreen * 0.45,
                    width: widthScreen,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomRowDataWidget(title: "Total", data: "${snapshot.data!.cases}"),
                          CustomRowDataWidget(title: "Recovered", data: "${snapshot.data!.recovered}"),
                          CustomRowDataWidget(title: "Deaths", data: "${snapshot.data!.deaths}"),
                          CustomRowDataWidget(title: "Active", data: "${snapshot.data!.active}"),
                          CustomRowDataWidget(
                              title: "Critical", data: "${snapshot.data!.critical}"),
                          CustomRowDataWidget(
                              title: "Today Deaths", data: "${snapshot.data!.todayDeaths}"),
                          CustomRowDataWidget(
                              title: "Today Recovered", data: "${snapshot.data!.todayRecovered}"),
                        ],
                      ),
                    ),
                  );
                }),
                ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CountryListSearch(),)), child: Text("Track Countries"))
              ],
            )
        ),
      ),
    );
  }
}
