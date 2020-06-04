import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:weather/src/models/city_model.dart';
import 'package:weather/src/models/weather_model.dart';

class Remote {

  String _url = "www.metaweather.com"; // Inicio de la url de petición a la API

  Future<List<City>> getCities(query) async {
    final url = Uri.https(_url, "api/location/search/?query=${query}");

    final response = await http.get(url); // Hacer la petición
    final decodedData = json.decode(response.body);
    final cities = new Cities.fromJsonList(decodedData); // Crear una lista de Cities con los datos recibidos
    return cities.items;
  }

  Future<Weather> getWeather(query) async{
    final response = await http.get("api/location/${query}/2020/6/4/");

    if(response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));
    } else throw Exception('Error retrieving data');
  }

}