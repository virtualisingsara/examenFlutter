import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:weather/src/models/city_model.dart';

class CardSwiper extends StatelessWidget {

  final List<City> cities;

  // Al llamarlo requiere una lista
  CardSwiper({ @required this.cities });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(top: 15.0),
        // Widget swiper de cards
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index){
                child:
                    child: GestureDetector( // Listener para cuando se haga click en una card
                      child: Text(cities[index].title),
                      onTap: () {
                        // Navegar a la vista weather pasándole la city
                        Navigator.pushNamed(context, "weather", arguments: cities[index]);
                      },
                    );
          },
          itemCount: cities.length,
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        )
    );
  }
}