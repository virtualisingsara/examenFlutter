import 'package:flutter/material.dart';
import 'package:weather/src/provider/remote.dart';
import 'package:weather/src/models/city_model.dart';
import 'package:weather/src/models/weather_model.dart';

class WeatherPage extends StatelessWidget {

  // Cargar el provider
  final provider = new Remote();

  Weather weather;

  @override
  Widget build(BuildContext context) {

    // Recibir la city desde la que se ha navegado a la vista detalle
    final City city = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView( // PageView con personalizaciones
          slivers: <Widget>[ // children
            SliverList( // ListView
              delegate: SliverChildListDelegate( // Lista de widgets
                  [
                    SizedBox(height: 10.0),
                    Text(city.title),
                    _getWeather(city.woeid)
                  ]
              ),
            )
          ],
        )
    );
  }

  Widget _getWeather(String query) {
    // Widget para recibir datos de forma asíncrona
    return FutureBuilder(
      future: provider.getWeather(query), // Llamada a datos
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) { // Snapshot contiene los datos recibidos
        if (snapshot.hasData) {
          Text(snapshot.data.date);
          Text(snapshot.data.state);
          Text(snapshot.data.temp);
        } else {
          return Container(
              child: Center(
                  child: CircularProgressIndicator()
              )
          );
        }
      },
    );
  }

}

