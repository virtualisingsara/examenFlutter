import 'package:flutter/material.dart';
import 'package:weather/src/models/city_model.dart';
import 'package:weather/src/provider/remote.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Cargar el provider
  final provider = new RemoteCity();

  String _city = "";
  String _selectedCity = "";
  List<String> _cities;

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
            _createCities()
          ],
        ),
    );
  }

  Widget _createCity() {
    // Widget de input text
    return TextField(
        decoration: InputDecoration(
          hintText: "city",
        ),
        // Guardar el input
        onChanged: (value) => setState(() {
          _city = value;
        })
    );
  }

  Widget _createCities() {
    return Row(
      children: <Widget>[
        Expanded(
          child: DropdownButton<String>(
            items: _cities.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            hint: Text(_selectedCity),
            onChanged: (val) {
              setState(() {
                _selectedCity = val;
                //_refreshAvatar();
              });
            },
          ),
        )
      ],
    );
  }
  
}
