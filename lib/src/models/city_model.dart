class City{
  final String id;
  final String name;

  City({this.id, this.name});

  factory City.fromJson(Map<String, dynamic> json){
    return City(
        id: json['woeid'],
        name: json['title']
    );
  }

}