import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidCountriesData
{
  Future<List<dynamic>> getdatafromAPI() async {
    var data;
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/countries");
    http.Response response = await http.get(uri);
    data = jsonDecode(response.body);
    if(response.statusCode == 200)
      {
        return data;
      } else{
      throw Exception("error");
    }
  }
}