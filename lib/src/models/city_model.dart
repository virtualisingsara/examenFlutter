class Cities {
  List<City> items = new List();
  Cities();
  // Recorrer el json y crear instancias Movie con cada item recibido
  Cities.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    } else {
      for (var item in jsonList) {
        final city = new City.fromJsonMap(item);
        items.add(city);
      }
    }
  }
}

class City {

  String title;
  String woeid;

  City({
    this.title,
    this.woeid
  });

  // Mapear la City json a nuestra clase City
  City.fromJsonMap(Map<String, dynamic> json) {
    title = json['title'];
    woeid = json['woeid'];
  }
}