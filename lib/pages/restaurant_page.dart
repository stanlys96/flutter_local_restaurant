import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/restaurant_card.dart';
import '../class/restaurant.dart';

class RestaurantPage extends StatelessWidget {
  static String routeName = 'restaurant_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 177, 27, 1),
        title: Text('Restaurants'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurants =
                  parseRestaurants(snapshot.data);
              // print(restaurants);
              return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    name: restaurants[index].name,
                    rating: restaurants[index].rating,
                    city: restaurants[index].city,
                    type: restaurants[index].type,
                    pictureId: restaurants[index].pictureId,
                    description: restaurants[index].description,
                    menus: restaurants[index].menus,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
