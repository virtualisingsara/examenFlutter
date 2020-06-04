class Weather{
  final String state;
  final String date;
  final String temp;

  Weather({this.state, this.date, this.temp});


  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      state: json['weather_state_name'],
      date: json['applicable_date'],
      temp: json['the_temp'],
    );
  }

}