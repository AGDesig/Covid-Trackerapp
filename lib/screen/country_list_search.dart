import 'package:covid_tracker_app/Model/country_model.dart';
import 'package:covid_tracker_app/screen/detail_of_each_country_screen.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import '../Utilities/covid_countries_data.dart';

class CountryListSearch extends StatefulWidget {
  const CountryListSearch({Key? key}) : super(key: key);

  @override
  State<CountryListSearch> createState() => _CountryListSearchState();
}

TextEditingController search = TextEditingController();

class _CountryListSearchState extends State<CountryListSearch> {
  @override
  Widget build(BuildContext context) {
    CovidCountriesData data = CovidCountriesData();
    return Scaffold(backgroundColor: Colors.lightGreenAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.white),
              hintText: "Search",

            ),
            onChanged: (value) {
              setState(() {});
            },
            controller: search,
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: data.getdatafromAPI(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                    baseColor: Colors.green.shade700,
                    highlightColor: Colors.grey.shade100,
                    child: ListTile(
                      leading: Container(
                        color: Colors.green,
                        height: 70,
                        width: 50,
                      ),
                      title: Container(
                        color: Colors.greenAccent,
                        height: 10,
                        width: 300,
                      ),
                      subtitle: Container(
                        color: Colors.black26,
                        height: 10,
                        width: 200,
                      ),
                    ));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var image = snapshot.data![index]['countryInfo']['flag'];
                  var subtitle =
                      Text(snapshot.data![index]['cases'].toString());
                  var title = Text(snapshot.data![index]['country']);
                  String title2 = snapshot.data![index]['country'];
                  if (search.text.isEmpty) {
                    return ListTile(shape: RoundedRectangleBorder(side: BorderSide(width: 1,)),
                      leading: Image(image: NetworkImage(image)),
                      title: title,
                      subtitle: subtitle,
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetailOfEachScreen(
                                flag: snapshot.data![index]['countryInfo']
                                    ['flag'],
                                name: snapshot.data![index]['country'],
                                cases: snapshot.data![index]['cases'],
                                todayCases: snapshot.data![index]['todayCases'],
                                deaths: snapshot.data![index]['deaths'],
                                todayDeaths: snapshot.data![index]
                                    ['todayDeaths'],
                                recovered: snapshot.data![index]['recovered'],
                                todayRecovered: snapshot.data![index]
                                    ['todayRecovered'],
                                active: snapshot.data![index]['active'],
                                critical: snapshot.data![index]['critical'],
                                population: snapshot.data![index]['population'],
                                continent: snapshot.data![index]['continent']);
                          },
                        ));
                      },
                    );
                  } else if (title2
                      .toLowerCase()
                      .contains(search.text.toLowerCase())) {
                    return ListTile(
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1,)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: Image(image: NetworkImage(image)),
                      title: title,
                      subtitle: subtitle,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DetailOfEachScreen(
                                flag: snapshot.data![index]['countryInfo']
                                    ['flag'],
                                name: snapshot.data![index]['country'],
                                cases: snapshot.data![index]['cases'],
                                todayCases: snapshot.data![index]['todayCases'],
                                deaths: snapshot.data![index]['deaths'],
                                todayDeaths: snapshot.data![index]
                                    ['todayDeaths'],
                                recovered: snapshot.data![index]['recovered'],
                                todayRecovered: snapshot.data![index]
                                    ['todayRecovered'],
                                active: snapshot.data![index]['active'],
                                critical: snapshot.data![index]['critical'],
                                population: snapshot.data![index]['population'],
                                continent: snapshot.data![index]['continent']);
                          },
                        ));
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              );
            },
          ),
        ));
  }
}
