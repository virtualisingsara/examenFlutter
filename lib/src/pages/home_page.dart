import 'package:flutter/material.dart';
import 'package:weather/src/models/city_model.dart';
import 'package:weather/src/provider/remote.dart';
import 'package:weather/src/widgets/card_swiper_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Cargar el provider
  final provider = new Remote();

  String _city = "";
  String _selectedCity = "";
  List<City> _cities;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Choose city:"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: <Widget>[
            _getCity(),
            Divider(),
            Container(
              child: _createSwiper(_city),
            )
          ],
        ),
    );
  }

  Widget _getCity() {
    // Widget de input text
    return TextField(
        decoration: InputDecoration(
          hintText: "city",
        ),
        // Guardar el input
        onChanged: (value) => setState(() {
          _city = value;
          _createSwiper(_city);
        })
    );
  }

  Widget _createSwiper(String query) {
    // Widget para recibir datos de forma asíncrona
    return FutureBuilder(
      future: provider.getCities(query), // Llamada a datos
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) { // Snapshot contiene los datos recibidos
        if (snapshot.hasData) {
          return CardSwiper(
              cities: snapshot.data
          );
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
