import 'dart:convert';

import '../Model/world_model.dart';
import 'package:http/http.dart' as http;

class CovidDataCallingFromAPI
{
  Stream<WorldModel> getdatafromAPI() async*
  {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/all");
    http.Response response = await http.get(uri);
    var DecodedBody = jsonDecode(response.body);
    if(response.statusCode == 200)
      {
        yield WorldModel.fromJson(DecodedBody);
      }
    else{
      throw Exception("error");
    }

  }
}