import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:weather/src/models/city_model.dart';
import 'package:weather/src/models/weather_model.dart';

class RemoteCity {

  Future<City> getCities(query) async{
    final response = await http.get("/api/location/search/?query=" + query);

    if(response.statusCode == 200){
      return City.fromJson(json.decode(response.body));
    } else throw Exception('Error retrieving data');
  }

}

class RemoteWeather {

  Future<Weather> getWeather(query) async{
    final response = await http.get("/api/location/" + query + "/2020/6/4/");

    if(response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));
    } else throw Exception('Error retrieving data');
  }

}